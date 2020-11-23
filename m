Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga18.intel.com ([134.134.136.126])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khG8p-0007RJ-3n
 for ath11k@lists.infradead.org; Mon, 23 Nov 2020 18:00:44 +0000
From: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 7/9] ath11k: make relay callbacks const
Date: Mon, 23 Nov 2020 19:59:27 +0200
Message-Id: <44e3d65b71025c462948d0c554061dc7b40ab488.1606153547.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

Now that relay_open() accepts const callbacks, make relay callbacks
const.

Cc: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/net/wireless/ath/ath11k/spectral.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/spectral.c b/drivers/net/wireless/ath/ath11k/spectral.c
index ac2a8cfdc1c0..1afe67759659 100644
--- a/drivers/net/wireless/ath/ath11k/spectral.c
+++ b/drivers/net/wireless/ath/ath11k/spectral.c
@@ -148,7 +148,7 @@ static int remove_buf_file_handler(struct dentry *dentry)
 	return 0;
 }
 
-static struct rchan_callbacks rfs_scan_cb = {
+static const struct rchan_callbacks rfs_scan_cb = {
 	.create_buf_file = create_buf_file_handler,
 	.remove_buf_file = remove_buf_file_handler,
 };
-- 
2.20.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
