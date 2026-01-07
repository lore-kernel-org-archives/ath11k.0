Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC02D0D157
	for <ath11k@archiver.kernel.org>; Wed,  7 Jan 2026 18:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZrZskx9vrgBES4oPwII0k8unlMuYBRuRXEAKy3ZhCuc=; b=mXKvhrChvwMO9QyGfpV0aD/jcg
	kiV9JkCZRdRuO7KL5vNOsCINP81IlSr62CcR2J2axAhJqIR6mw3fuxCBA4g3BPvdqd5ARUYyUURZ9
	Se9qqqqt8n8IVKW42jdo/64/Nt3siTFNma+67tOXMhkisQKUh4xg9+zsJHhwuUrPz87k2UqS/uVA2
	92QqA0cm+6wcwftgcc/Da59VaZhevErsJy6CJ8T7MDnrzjbDlx/ZuCjngSRjFUYEdrGs4ltmXXHIg
	8RH9koFil0HnA9mjPJnkJ6tahln8nixCZHf77SzZZnMM6qnE3Mjrh3tX5uJ3fze7EKCMlwnXiWUdc
	MyxirgWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY2F-0000000FR7M-2F51;
	Wed, 07 Jan 2026 18:13:31 +0000
Received: from fout-a4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY2D-0000000FR6Y-1lPs
	for ath11k@lists.infradead.org;
	Wed, 07 Jan 2026 18:13:30 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id D4C16EC0333;
	Wed,  7 Jan 2026 13:13:25 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Wed, 07 Jan 2026 13:13:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1767809605;
	 x=1767896005; bh=ZrZskx9vrgBES4oPwII0k8unlMuYBRuRXEAKy3ZhCuc=; b=
	HYBaXROdkunJWZvjBNC4WPI089TK5jpJ8+SPS3jO1FaJOz7c1wBSweV0Cge2X5KQ
	fjnqEdeul0hocssh9dOGKGo78iiUxrC3xZaKn22pcUm1JAIid7QZtjsBJFEypaLH
	y2y5HMfwAQl1tN+2PAZQVmYNk34kvN8ZK38ZHjbhRuC1skI93gO132dxfyrNRUCW
	X9WXigOnqcimKDqKxa+kR0Gm8+FdXbm1oBxW/cHvA+AOCPxEIVAJnEkNrwkoaVJP
	x8Kqw4W72zAjfA+YxJ/9JBBaW+3A6VQYl2mcp8oNqJQgK4E35ZDFjEdGmiSc0oXm
	FcvhMRFXBWb9htrpOI9N/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767809605; x=
	1767896005; bh=ZrZskx9vrgBES4oPwII0k8unlMuYBRuRXEAKy3ZhCuc=; b=N
	ike2uT16M7R3Iz8l94WU2cX6euffp5QB2VPITDEphWQPnx/edbQ6tyWZ6wqhkXJ+
	IoktNQGkEAqL6lrl7LuV1N5uFbYr+G7TSEVKRswz3u+pdtWzET/x3kO9oKzqFgKP
	1EaklSQ5hamTm0JYyGLERgOTAhPTFxMtlek11Av0AxoZTJsZ/tDER8NecJb1GuYi
	NRkpRaqOiTWAUBvHh18cyG38C9I1dGtABvva+FbpGxebPX7Nc0oVOgFvfapxzNbH
	ENRSyd//TKxp/ByBgMzMgdYt+29A+NBREDzepDCNh3rjAz+5Ub0BWU3x9dhGDgj3
	ZwZN1lJslyYO/9fPUxM+g==
X-ME-Sender: <xms:RaJeaStI_pF0UAR2NiGSUPd9N_u_CGQ_o28RgQeGqIgdvKYpO0yiLQ>
    <xme:RaJeaSQwTktjkUL93m07IDnp8-BtNx1-H_48Sf_w59_0nJUuH0VkLIMI3kWIqQodE
    CM0GLZT8Q6c2aVBeahB4sbqemB6yX1Og23uVACEbTY_8Hl1Q1NVNBM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdefjeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfofgrrhhk
    ucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtg
    grqeenucggtffrrghtthgvrhhnpedtffevgfethfevteduvdefleevkedtuddvlefghefg
    ieekffejteejveffkedthfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhn
    qdhlvghnohhvohesshhquhgvsggsrdgtrgdpnhgspghrtghpthhtohepgedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtoheprhhoshhssehkrghllhhishhtihdruhhspdhrtghp
    thhtohepjhhjohhhnhhsohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrthhhud
    dukheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhig
    qdifihhrvghlvghsshesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:RaJeaY0LkARX0etxX8RIEVaURS5SL8f1OUtX79pUCf08ljEqZPoBfw>
    <xmx:RaJeaejmR5b83mXAt31tmXPSyAznh6oUkO-D-jQSPy41yi6gD46zUw>
    <xmx:RaJeaUbU3CvBItD8eFDxVv3yFNlJZUaa70DgzjqRQYS3UX26YTy1AA>
    <xmx:RaJeaWQscpObQ5jgORm7a4YefB0QmL5Ul7ATuBYII9jaOeARC-apQg>
    <xmx:RaJeaeb2DK0w7WgJI99XkO1mmHG7sYnT-2-URNOyKbFkoJM7P0R0501h>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9678B2CE0078; Wed,  7 Jan 2026 13:13:25 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AmQXQaeoO3KB
Date: Wed, 07 Jan 2026 13:13:04 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Ross Vandegrift" <ross@kallisti.us>, "Jeff Johnson" <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Message-Id: <b6b3255b-69bf-40a3-b80e-22b57f3e18d0@app.fastmail.com>
In-Reply-To: <wj7o2kmb7g54stdjvxp2hjqrnutnq3jbf4s2uh4ctvmlxdq7tf@nbkj2ebakhrd>
References: <wj7o2kmb7g54stdjvxp2hjqrnutnq3jbf4s2uh4ctvmlxdq7tf@nbkj2ebakhrd>
Subject: Re: [PATCH v2] wifi: ath11k: add pm quirk for Thinkpad Z13/Z16 Gen1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_101329_538575_F3274D9D 
X-CRM114-Status: GOOD (  16.12  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Sat, Jan 3, 2026, at 8:00 PM, Ross Vandegrift wrote:
> Z16 Gen1 has the wakeup-from-suspend issues from [1] but was never added
> to the appropriate quirk list.  I've tested this patch on top of 6.18.2,
> it fixes the issue for me on 21D4
>
> Mark Pearson provided the other product IDs covering the second Z16 Gen1
> and both Z13 Gen1 identifiers.  They share the same firmware, and folks
> in the bugzilla report do indeed see the problem on Z13.
>
> [1] - https://bugzilla.kernel.org/show_bug.cgi?id=219196
>
> Signed-off-by: Ross Vandegrift <ross@kallisti.us>
> ---
>  drivers/net/wireless/ath/ath11k/core.c | 28 ++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath11k/core.c 
> b/drivers/net/wireless/ath/ath11k/core.c
> index 812686173ac8..03dddc1cd003 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -994,6 +994,34 @@ static const struct dmi_system_id 
> ath11k_pm_quirk_table[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "21F9"),
>  		},
>  	},
> +	{
> +		.driver_data = (void *)ATH11K_PM_WOW,
> +		.matches = { /* Z13 G1 */
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21D2"),
> +		},
> +	},
> +	{
> +		.driver_data = (void *)ATH11K_PM_WOW,
> +		.matches = { /* Z13 G1 */
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21D3"),
> +		},
> +	},
> +	{
> +		.driver_data = (void *)ATH11K_PM_WOW,
> +		.matches = { /* Z16 G1 */
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21D4"),
> +		},
> +	},
> +	{
> +		.driver_data = (void *)ATH11K_PM_WOW,
> +		.matches = { /* Z16 G1 */
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21D5"),
> +		},
> +	},
>  	{}
>  };
> 
> -- 
> 2.47.3

Tested on my Z13, and works well. Unfortunately my Z16 is dead so I couldn't sanity check that - but code looks good.

Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark

