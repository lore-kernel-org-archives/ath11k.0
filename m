Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inEv3-0001nR-Ep
 for ath11k@lists.infradead.org; Fri, 03 Jan 2020 04:50:42 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH v2] net: qrtr: fix len of skb_put_padto in qrtr_node_enqueue
Date: Fri,  3 Jan 2020 12:50:16 +0800
Message-Id: <20200103045016.12459-1-wgong@codeaurora.org>
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
To: davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, ath11k@lists.infradead.org

From: Carl Huang <cjhuang@codeaurora.org>

The len used for skb_put_padto is wrong, it need to add len of hdr.

In qrtr_node_enqueue, local variable size_t len is assign with
skb->len, then skb_push(skb, sizeof(*hdr)) will add skb->len with
sizeof(*hdr), so local variable size_t len is not same with skb->len
after skb_push(skb, sizeof(*hdr)).

Then the purpose of skb_put_padto(skb, ALIGN(len, 4)) is to add add
pad to the end of the skb's data if skb->len is not aligned to 4, but
unfortunately it use len instead of skb->len, at this line, skb->len
is 32 bytes(sizeof(*hdr)) more than len, for example, len is 3 bytes,
then skb->len is 35 bytes(3 + 32), and ALIGN(len, 4) is 4 bytes, so
__skb_put_padto will do nothing after check size(35) < len(4), the
correct value should be 36(sizeof(*hdr) + ALIGN(len, 4) = 32 + 4),
then __skb_put_padto will pass check size(35) < len(36) and add 1 byte
to the end of skb's data, then logic is correct.

function of skb_push:
void *skb_push(struct sk_buff *skb, unsigned int len)
{
	skb->data -= len;
	skb->len  += len;
	if (unlikely(skb->data < skb->head))
		skb_under_panic(skb, len, __builtin_return_address(0));
	return skb->data;
}

function of skb_put_padto
static inline int skb_put_padto(struct sk_buff *skb, unsigned int len)
{
	return __skb_put_padto(skb, len, true);
}

function of __skb_put_padto
static inline int __skb_put_padto(struct sk_buff *skb, unsigned int len,
				  bool free_on_error)
{
	unsigned int size = skb->len;

	if (unlikely(size < len)) {
		len -= size;
		if (__skb_pad(skb, len, free_on_error))
			return -ENOMEM;
		__skb_put(skb, len);
	}
	return 0;
}

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
v2: change description
 net/qrtr/qrtr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/qrtr/qrtr.c b/net/qrtr/qrtr.c
index 88f98f27ad88..3d24d45be5f4 100644
--- a/net/qrtr/qrtr.c
+++ b/net/qrtr/qrtr.c
@@ -196,7 +196,7 @@ static int qrtr_node_enqueue(struct qrtr_node *node, struct sk_buff *skb,
 	hdr->size = cpu_to_le32(len);
 	hdr->confirm_rx = 0;
 
-	skb_put_padto(skb, ALIGN(len, 4));
+	skb_put_padto(skb, ALIGN(len, 4) + sizeof(*hdr));
 
 	mutex_lock(&node->ep_lock);
 	if (node->ep)
-- 
2.23.0

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
