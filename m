Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jl7eZ-0001e2-JK
 for ath11k@lists.infradead.org; Tue, 16 Jun 2020 09:13:15 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2 0/8] ath11k: Add IPQ6018 support
References: <1591709581-18039-1-git-send-email-akolli@codeaurora.org>
Date: Tue, 16 Jun 2020 12:13:01 +0300
In-Reply-To: <1591709581-18039-1-git-send-email-akolli@codeaurora.org>
 (Anilkumar Kolli's message of "Tue, 9 Jun 2020 19:02:53 +0530")
Message-ID: <87pn9zidb6.fsf@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Anilkumar Kolli <akolli@codeaurora.org> writes:

> IPQ6018 has a 5G radio and 2G radio with 2x2
> and shares IPQ8074 configuration.
>
> Tested on: IPQ6018 WLAN.HK.2.2-02134-QCAHKSWPL_SILICONZ-1
> Tested on: IPQ8074 WLAN.HK.2.4.0.1-00009-QCAHKSWPL_SILICONZ-1 

To get the multiple hw support faster in (I need them also for QCA6390
patches) I split this into multiple sets:

>   ath11k: update firmware files read path
>   ath11k: rename default board file

These are now applied.

>   ath11k: define max_radios in hw_params
>   ath11k: add hw_ops for pdev id to hw_mac mapping
>   ath11k: Add bdf-addr in hw_params

I'll modify these a bit, remove all IPQ6018 references from them and
then submit them myself.

>   dt: bindings: net: update compatible for ath11k
>   ath11k: add ce services for IPQ6018

Anil, please resubmit these as v3 based on the comments.

>   ath11k: add IPQ6018 support

Anil, add this as the last patch in your v3 series. And do note that I
will split the part adding ath11k_init_hw_params() function to a
separate patch, so no need to include it in this patch anymore.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
