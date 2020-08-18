Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7yBf-0007L5-EX
 for ath11k@lists.infradead.org; Tue, 18 Aug 2020 09:45:51 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2 01/12] ath11k: hal: create register values dynamically
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1597576599-8857-2-git-send-email-kvalo@codeaurora.org>
References: <1597576599-8857-2-git-send-email-kvalo@codeaurora.org>
Message-Id: <20200818094521.C3FACC433CB@smtp.codeaurora.org>
Date: Tue, 18 Aug 2020 09:45:21 +0000 (UTC)
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

> QCA6390 has different register offset compared to IPQ8074, so need to
> attach the register offset dynamically based on hw_params.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2
> 
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

12 patches applied to ath-next branch of ath.git, thanks.

6976433c4778 ath11k: hal: create register values dynamically
2b5e665bedf7 ath11k: hal: cleanup dynamic register macros
e3396b8bddd2 ath11k: ce: support different CE configurations
6e5e9f59dc5b ath11k: ce: remove host_ce_config_wlan macro
d9d4b5f35488 ath11k: ce: remove CE_COUNT() macro
7cea7c5b0e7b ath11k: hal: assign msi_addr and msi_data to srng
1a05ed37c513 ath11k: ce: get msi_addr and msi_data before srng setup
e5c860e121c2 ath11k: disable CE interrupt before hif start
5f859bc02c7b ath11k: force single pdev only for QCA6390
2d4bcbed5b7d ath11k: initialize wmi config based on hw_params
ed0192f7942e ath11k: wmi: put hardware to DBS mode
13ecd81fbad6 ath11k: dp: redefine peer_map and peer_unmap

-- 
https://patchwork.kernel.org/patch/11716083/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
