Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 4/9] relay: allow the use of const callback structs
Date: Mon, 23 Nov 2020 19:59:24 +0200
Message-Id: <cc3ff292e4eb4fdc56bee3d690c7b8e39209cd37.1606153547.git.jani.nikula@intel.com>
In-Reply-To: <cover.1606153547.git.jani.nikula@intel.com>
References: <cover.1606153547.git.jani.nikula@intel.com>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, jani.nikula@intel.com, intel-gfx@lists.freedesktop.org, linux-wireless@vger.kernel.org, QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, ath10k@lists.infradead.org, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

None of the relay users require the use of mutable structs for
callbacks, however the relay code does. Instead of assigning the default
callback for subbuf_start, add a wrapper to conditionally call the
client callback if available, and fall back to default behaviour
otherwise.

This lets all relay users make their struct rchan_callbacks const data.

Cc: linux-block@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>
Cc: ath11k@lists.infradead.org
Cc: ath10k@lists.infradead.org
Cc: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org
Cc: QCA ath9k Development <ath9k-devel@qca.qualcomm.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

v2: Simplify after nuking some callbacks and making some others
mandatory in previous patches, as per Christoph's review comments.

I thought about adding wrappers for the now-mandatory create_buf_file
and remove_buf_file as well, for consistency, but ended up leaving them
out.
---
 include/linux/relay.h |  4 ++--
 kernel/relay.c        | 35 +++++++++++------------------------
 2 files changed, 13 insertions(+), 26 deletions(-)

diff --git a/include/linux/relay.h b/include/linux/relay.h
index 99d024475ba5..72b876dd5cb8 100644
--- a/include/linux/relay.h
+++ b/include/linux/relay.h
@@ -62,7 +62,7 @@ struct rchan
 	size_t subbuf_size;		/* sub-buffer size */
 	size_t n_subbufs;		/* number of sub-buffers per buffer */
 	size_t alloc_size;		/* total buffer size allocated */
-	struct rchan_callbacks *cb;	/* client callbacks */
+	const struct rchan_callbacks *cb; /* client callbacks */
 	struct kref kref;		/* channel refcount */
 	void *private_data;		/* for user-defined data */
 	size_t last_toobig;		/* tried to log event > subbuf size */
@@ -157,7 +157,7 @@ struct rchan *relay_open(const char *base_filename,
 			 struct dentry *parent,
 			 size_t subbuf_size,
 			 size_t n_subbufs,
-			 struct rchan_callbacks *cb,
+			 const struct rchan_callbacks *cb,
 			 void *private_data);
 extern int relay_late_setup_files(struct rchan *chan,
 				  const char *base_filename,
diff --git a/kernel/relay.c b/kernel/relay.c
index dd4ec4ec07f3..02bdba5372cb 100644
--- a/kernel/relay.c
+++ b/kernel/relay.c
@@ -252,19 +252,14 @@ EXPORT_SYMBOL_GPL(relay_buf_full);
  * High-level relay kernel API and associated functions.
  */
 
-/*
- * rchan_callback implementations defining default channel behavior.  Used
- * in place of corresponding NULL values in client callback struct.
- */
-
-/*
- * subbuf_start() default callback.  Does nothing.
- */
-static int subbuf_start_default_callback (struct rchan_buf *buf,
-					  void *subbuf,
-					  void *prev_subbuf,
-					  size_t prev_padding)
+/* subbuf_start callback wrapper */
+static int cb_subbuf_start(struct rchan_buf *buf, void *subbuf,
+			   void *prev_subbuf, size_t prev_padding)
 {
+	if (buf->chan->cb->subbuf_start)
+		return buf->chan->cb->subbuf_start(buf, subbuf,
+						   prev_subbuf, prev_padding);
+
 	if (relay_buf_full(buf))
 		return 0;
 
@@ -314,7 +309,7 @@ static void __relay_reset(struct rchan_buf *buf, unsigned int init)
 	for (i = 0; i < buf->chan->n_subbufs; i++)
 		buf->padding[i] = 0;
 
-	buf->chan->cb->subbuf_start(buf, buf->data, NULL, 0);
+	cb_subbuf_start(buf, buf->data, NULL, 0);
 }
 
 /**
@@ -442,14 +437,6 @@ static void relay_close_buf(struct rchan_buf *buf)
 	kref_put(&buf->kref, relay_remove_buf);
 }
 
-static void setup_callbacks(struct rchan *chan,
-				   struct rchan_callbacks *cb)
-{
-	if (!cb->subbuf_start)
-		cb->subbuf_start = subbuf_start_default_callback;
-	chan->cb = cb;
-}
-
 int relay_prepare_cpu(unsigned int cpu)
 {
 	struct rchan *chan;
@@ -495,7 +482,7 @@ struct rchan *relay_open(const char *base_filename,
 			 struct dentry *parent,
 			 size_t subbuf_size,
 			 size_t n_subbufs,
-			 struct rchan_callbacks *cb,
+			 const struct rchan_callbacks *cb,
 			 void *private_data)
 {
 	unsigned int i;
@@ -529,7 +516,7 @@ struct rchan *relay_open(const char *base_filename,
 		chan->has_base_filename = 1;
 		strlcpy(chan->base_filename, base_filename, NAME_MAX);
 	}
-	setup_callbacks(chan, cb);
+	chan->cb = cb;
 	kref_init(&chan->kref);
 
 	mutex_lock(&relay_channels_mutex);
@@ -712,7 +699,7 @@ size_t relay_switch_subbuf(struct rchan_buf *buf, size_t length)
 	new_subbuf = buf->subbufs_produced % buf->chan->n_subbufs;
 	new = buf->start + new_subbuf * buf->chan->subbuf_size;
 	buf->offset = 0;
-	if (!buf->chan->cb->subbuf_start(buf, new, old, buf->prev_padding)) {
+	if (!cb_subbuf_start(buf, new, old, buf->prev_padding)) {
 		buf->offset = buf->chan->subbuf_size + 1;
 		return 0;
 	}
-- 
2.20.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
