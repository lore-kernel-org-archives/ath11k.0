Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-11.smtp-out.us-west-2.amazonses.com ([54.240.27.11])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iabYv-00023B-4N
 for ath11k@lists.infradead.org; Fri, 29 Nov 2019 08:23:38 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Changes in ath11k patch submission process
Date: Fri, 29 Nov 2019 08:23:34 +0000
Message-ID: <0101016eb6421564-1d958a07-0bde-44ca-9a0a-ab29760aa4fb-000000@us-west-2.amazonses.com>
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
To: ath11k@lists.infradead.org

Hi,

now that ath11k is accepted to upstream (=ath-next branch) and all
patches from ath11k-post-bringup are now applied to ath-next branch,
there are some changes in the process. I wrote some documentation here:

https://wireless.wiki.kernel.org/en/users/drivers/ath11k/submittingpatches

Most important change is that patches need to be submitted both
linux-wireless and ath11k lists, just like with ath10k patches.

ath11k-bringup and ath11k-post-bringup branches are
not used anymore. I will leave them in the repo for historical purposes
but that's it.

The ath11k specific patchwork project will not be used anymore. But I
will not request to delete it either so that old links still work etc.
Instead the linux-wireless project is used:

https://patchwork.kernel.org/project/linux-wireless/list/?state=*&q=ath11k

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
