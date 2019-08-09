Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvzOx-0005Xr-Jv
 for ath11k@lists.infradead.org; Fri, 09 Aug 2019 07:33:29 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath11k: remove bdf-addr from dtsi
References: <1565188479-3027-1-git-send-email-akolli@codeaurora.org>
Date: Fri, 09 Aug 2019 10:33:23 +0300
In-Reply-To: <1565188479-3027-1-git-send-email-akolli@codeaurora.org>
 (Anilkumar Kolli's message of "Wed, 7 Aug 2019 20:04:39 +0530")
Message-ID: <87blwydc8s.fsf@kamboji.qca.qualcomm.com>
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
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: ath11k@lists.infradead.org

Anilkumar Kolli <akolli@codeaurora.org> writes:

> Remove bdf-addr from DT entry and hard code in driver.
>
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>

I improved the commit log slightly and fixed these warnings:

drivers/net/wireless/ath/ath11k/qmi.c: In function 'ath11k_qmi_alloc_target_mem_chunk':
drivers/net/wireless/ath/ath11k/qmi.c:1680:14: warning: unused variable 'mode' [-Wunused-variable]
drivers/net/wireless/ath/ath11k/qmi.c:1679:17: warning: unused variable 'dev' [-Wunused-variable]
drivers/net/wireless/ath/ath11k/qmi.c: In function 'ath11k_qmi_load_bdf':
drivers/net/wireless/ath/ath11k/qmi.c:1849:17: warning: unused variable 'dev' [-Wunused-variable]
drivers/net/wireless/ath/ath11k/qmi.c: In function 'ath11k_qmi_init_service':
drivers/net/wireless/ath/ath11k/qmi.c:2396:17: warning: unused variable 'dev' [-Wunused-variable]
drivers/net/wireless/ath/ath11k/qmi.c: In function 'ath11k_qmi_alloc_target_mem_chunk':
drivers/net/wireless/ath/ath11k/qmi.c:1680:14: warning: unused variable 'mode' [-Wunused-variable]
drivers/net/wireless/ath/ath11k/qmi.c:1679:17: warning: unused variable 'dev' [-Wunused-variable]
drivers/net/wireless/ath/ath11k/qmi.c: In function 'ath11k_qmi_load_bdf':
drivers/net/wireless/ath/ath11k/qmi.c:1849:17: warning: unused variable 'dev' [-Wunused-variable]
drivers/net/wireless/ath/ath11k/qmi.c: In function 'ath11k_qmi_init_service':
drivers/net/wireless/ath/ath11k/qmi.c:2396:17: warning: unused variable 'dev' [-Wunused-variable]

It's available in the pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending-ath11k&id=ede552de48c93c76385c3c8ecc5690560782baef

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
