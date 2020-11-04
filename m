Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaLQf-0001iq-EB
 for ath11k@lists.infradead.org; Wed, 04 Nov 2020 16:14:37 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath11k: Initialize complete alpha2 for regulatory change
References: <20201021140555.4114715-1-sven@narfation.org>
Date: Wed, 04 Nov 2020 18:14:12 +0200
In-Reply-To: <20201021140555.4114715-1-sven@narfation.org> (Sven Eckelmann's
 message of "Wed, 21 Oct 2020 16:05:55 +0200")
Message-ID: <87v9elqeuj.fsf@codeaurora.org>
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
To: Sven Eckelmann <sven@narfation.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Sven Eckelmann <sven@narfation.org> writes:

> The function ath11k_wmi_send_init_country_cmd is taking 3 byte from alpha2
> of the structure wmi_init_country_params. But the function
> ath11k_reg_notifier is only initializing 2 bytes. The third byte is
> therefore always an uninitialized value.
>
> The command can happen to look like
>
>   0c 00 87 02 01 00 00 00 00 00 00 00 43 41 f8 00
>
> instead of
>
>   0c 00 87 02 01 00 00 00 00 00 00 00 43 41 00 00
>
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Sven Eckelmann <sven@narfation.org>

On what hardware and firmware did you test this? I'll add that to the
commit log. I know it doesn't matter here but I want to have that info
anyway.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
