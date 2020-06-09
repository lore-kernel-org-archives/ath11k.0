Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiXyo-0000qD-KK
 for ath11k@lists.infradead.org; Tue, 09 Jun 2020 06:43:28 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 0/8] ath11k: Add IPQ6018 support
References: <1591678993-11016-1-git-send-email-akolli@codeaurora.org>
Date: Tue, 09 Jun 2020 09:43:21 +0300
In-Reply-To: <1591678993-11016-1-git-send-email-akolli@codeaurora.org>
 (Anilkumar Kolli's message of "Tue, 9 Jun 2020 10:33:05 +0530")
Message-ID: <87bllszqly.fsf@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Anilkumar Kolli <akolli@codeaurora.org> writes:

> IPQ6018 has a 5G radio and 2G radio with 2x2
> and shares IPQ8074 configuration.
>
> Tested on: IPQ6018 WLAN.HK.2.2-02134-QCAHKSWPL_SILICONZ-1
> Tested on: IPQ8074 WLAN.HK.2.4.0.1-00009-QCAHKSWPL_SILICONZ-1 
>
> Anilkumar Kolli (8):
>   ath11k: update firmware files read path
>   ath11k: rename default board file
>   dt: bindings: net: update compatible for ath11k
>   ath11k: add IPQ6018 support
>   ath11k: define max_radios in hw_params
>   ath11k: add hw_ops for pdev id to hw_mac mapping
>   ath11k: add ce services for IPQ6018
>   ath11k: Add bdf-addr in hw_params

You need to CC the device tree list, so please resubmit as v2. And to
make their review easier please move the binding doc update as the first
patch.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
