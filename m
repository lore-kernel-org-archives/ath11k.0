Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13AEAC433EF
	for <ath11k@archiver.kernel.org>; Mon,  4 Apr 2022 16:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vlPQBGYi50VRZeyvx/WzRo932+O1oMNvYPdDpGRtIzs=; b=JZBpqElHTvCslp
	3iuTm5/Jb+sK28HdjLtyMlYtVH0BC+SumtWUSrx0iJ2gfMKOknaQWeEE08cebBtnQovf/R8UL23rS
	oO7rU3oy/6tF44xR7sKhpZdBSrJrs78qmGS1hk9s8enEWBnbY7JjKHakvCkVISyYNadQWbGO46xo1
	ILm0cU5+P9Pmrw/b8KZrqAv/3Z6AgYkmtE0tJSGFZVv02hh9UtG4EMI8durL6NkOldURXK6KtLHGd
	RvSFcgL1ED8s3QfNwNBn26v0BstYBz1/VVuHX/v/7CpBDBD2EonBowKqoIu4bQ2cxKJIUitrCAUNX
	wrzNeeEVbdKP2nZd3ujg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbPfx-00Fp0U-J5; Mon, 04 Apr 2022 16:35:33 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbPfu-00Foz3-OE
 for ath11k@lists.infradead.org; Mon, 04 Apr 2022 16:35:32 +0000
Received: by mail-io1-xd36.google.com with SMTP id x4so11937931iop.7
 for <ath11k@lists.infradead.org>; Mon, 04 Apr 2022 09:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sartura-hr.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u2tjCgL5q60NGSsrT51lKaR05T0paQW81C5vQQ853wY=;
 b=LU/LuEgYuinqEj95G4H6JtZIbQpHE6Wkox3vsqOb7m7lngKeo8ezZjUZB4v+fMzrXu
 i7Mox9Hha2YBG2+eHgJc2l9JEC4zF8ZM6xXEbdc37VoB58K8gfNWoq8c3Odp3BA/21Wj
 8xx8CnXdvah5jZ4gGbPfynV1of+K7wveZu6ohsinc1J4F7G1fu9EQEwU4GwH50u0dX/R
 tIVVPOC3JjPkru7Ee/eKnl5+bJQJ3/AshfySEgepXYEt9Ba7CQGsGL2IeBF9/KuX9IrP
 JbX5rZg2SYWlWHW9g+t4sfQ+vuvn6EP/KTcrv8ic5QexGre+YCX3K/iPVS+gp28DNVr7
 JX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u2tjCgL5q60NGSsrT51lKaR05T0paQW81C5vQQ853wY=;
 b=YKoHGstQ/55Xf9j+boPTLt6rbLwu6SIw3GFgGsHh4rG3mmlM/PRR07bwGaKxD0JqDb
 MxYNw/i0XFoQQbLAakGSe74dTyW/2nSAvCliTYfZUO0TjsJB3EcwGiqFT/5a2ggzUwsr
 PrHgxdk0/e22v2/p5h+lJwjVz5Xb3+8jF61fo8bqYMHxhqfSzydD31EuBY4SsdbmUuDP
 Wxz74ykPvJ2HXUdP24jElOXiqePJlCg9WdZuLlvglRMbK9LFj+g8D7qwEgUAkJLwRBxX
 nuYMcysmaXtxMY/6n1X52U8ynnY8MSDxa/66BpF4+aqdurG/c371TI27ngvUj6UUJqhC
 JSGQ==
X-Gm-Message-State: AOAM532C2e68Jsd1dc+P9rBn65lLT8EENA1pssgR2FwBrbR4UQPYTrr0
 gsygYOyB8vjKcBVKd11Ng2TUBxmRfLrFKl9Y88GpsA==
X-Google-Smtp-Source: ABdhPJxGPGo6ZeYMtrmrzTqcFfxOkAJo2j1ZjwZE5kyqJVyLQGVWZDw37xIK3ZrpEfi7IjV6VOZwuUlNmhvG7sZ1KNI=
X-Received: by 2002:a05:6602:15d1:b0:649:1ed6:edcf with SMTP id
 f17-20020a05660215d100b006491ed6edcfmr506912iow.74.1649090129391; Mon, 04 Apr
 2022 09:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220404105324.13810-1-straube.linux@gmail.com>
In-Reply-To: <20220404105324.13810-1-straube.linux@gmail.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Mon, 4 Apr 2022 18:35:18 +0200
Message-ID: <CA+HBbNHEK=CbyeeyPG=s=D2xofdSbk8Lxx5R9nij_cp6t7ybDA@mail.gmail.com>
Subject: Re: [PATCH] ath11k: do not return random value
To: Michael Straube <straube.linux@gmail.com>
Cc: kvalo@kernel.org, David Miller <davem@davemloft.net>, kuba@kernel.org, 
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_093530_822601_BBDA1B23 
X-CRM114-Status: GOOD (  19.51  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Mon, Apr 4, 2022 at 12:54 PM Michael Straube <straube.linux@gmail.com> wrote:
>
> Function ath11k_qmi_assign_target_mem_chunk() returns a random value
> if of_parse_phandle() fails because the return variable ret is not
> initialized before calling of_parse_phandle(). Return -EINVAL to avoid
> possibly returning 0, which would be wrong here.
>
> Issue found by smatch.
>
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>  drivers/net/wireless/ath/ath11k/qmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
> index 65d3c6ba35ae..81b2304b1fde 100644
> --- a/drivers/net/wireless/ath/ath11k/qmi.c
> +++ b/drivers/net/wireless/ath/ath11k/qmi.c
> @@ -1932,7 +1932,7 @@ static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
>                         if (!hremote_node) {
>                                 ath11k_dbg(ab, ATH11K_DBG_QMI,
>                                            "qmi fail to get hremote_node\n");
> -                               return ret;
> +                               return -EINVAL;
>                         }
>
>                         ret = of_address_to_resource(hremote_node, 0, &res);
> --
> 2.35.1

Hi Michael,
This is already solved in ath-next and 5.18-rc1:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/net/wireless/ath/ath11k/qmi.c?h=v5.18-rc1&id=c9b41832dc080fa59bad597de94865b3ea2d5bab

Regards,
Robert
>
>
> --
> ath11k mailing list
> ath11k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath11k



-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
