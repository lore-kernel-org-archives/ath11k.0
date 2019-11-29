Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-185.smtp-out.us-west-2.amazonses.com ([54.240.27.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iab3t-0000KU-4u
 for ath11k@lists.infradead.org; Fri, 29 Nov 2019 07:51:34 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/9] ath11k: Update tx and rx chain count properly on
 drv_set_antenna
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <0101016eb11a10c9-dd904af5-539a-4c05-9ffc-3a1cc33b99f5-000000@us-west-2.amazonses.com>
References: <0101016eb11a10c9-dd904af5-539a-4c05-9ffc-3a1cc33b99f5-000000@us-west-2.amazonses.com>
Message-ID: <0101016eb624bd91-079fe960-c38d-4ec5-a59c-d247a2fcc353-000000@us-west-2.amazonses.com>
Date: Fri, 29 Nov 2019 07:51:31 +0000
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> wrote:

> Set the number of tx and rx chains properly on drv_set_antenna().
> This will ensure the related ht/vht/he caps are properly recalculated
> based on the tx/rx chains set.
> 
> Signed-off-by: Sriram R <srirrama@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

9 patches applied to ath-next branch of ath.git, thanks.

a3c5195a97af ath11k: Update tx and rx chain count properly on drv_set_antenna
c000e56ee6b0 ath11k: Advertise MPDU start spacing as no restriction
5e02bc7354e1 ath11k: fix memory leak in monitor mode
28dee8ef7645 ath11k: fix vht guard interval mapping
a9e945eadf17 ath11k: update tx duration in station info
b9269a078ae6 ath11k: Skip update peer stats for management packets
0366f42640a4 ath11k: Move mac80211 hw allocation before wmi_init command
9c57d7e3b488 ath11k: Setup REO destination ring before sending wmi_init command
fcaf49d0f2dc ath11k: fix indentation in ath11k_mac_prepare_he_mode()

-- 
https://patchwork.kernel.org/patch/11265469/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
