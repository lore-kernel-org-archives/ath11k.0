Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVWso-0003Zn-8f
 for ath11k@lists.infradead.org; Mon, 04 May 2020 08:55:29 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v4 1/2] ath11k: fix mgmt_tx_wmi cmd sent to FW for deleted
 vdev
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1588049126-1490-2-git-send-email-murugana@codeaurora.org>
References: <1588049126-1490-2-git-send-email-murugana@codeaurora.org>
Message-Id: <20200504085524.36769C433BA@smtp.codeaurora.org>
Date: Mon,  4 May 2020 08:55:24 +0000 (UTC)
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
To: Sathishkumar Muruganandam <murugana@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Sathishkumar Muruganandam <murugana@codeaurora.org> wrote:

> In Multi-AP VAP scenario with frequent interface up-down, there is a
> chance that ath11k_mgmt_over_wmi_tx_work() will dequeue a skb
> corresponding to currently deleted/stopped vdev.
> 
> FW will assert on receiving mgmt_tx_wmi cmd for already deleted vdev.
> Hence adding validation checks for arvif present on the corresponding
> ar before sending mgmt_tx_wmi cmd.
> 
> Signed-off-by: Sathishkumar Muruganandam <murugana@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

66307ca04057 ath11k: fix mgmt_tx_wmi cmd sent to FW for deleted vdev
657680cc86ca ath11k: add DBG_MAC prints to track vdev events

-- 
https://patchwork.kernel.org/patch/11513813/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
