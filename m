Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B9EC4167B
	for <ath11k@archiver.kernel.org>; Wed,  6 Dec 2023 20:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rNhyFZvgFU5pptzAoScDKDcqRFNRihHR3+C5yAvq3i8=; b=gLJwu0SMP6d/EkREWcbLbYhNWp
	C4MniLSMh2owFksAfjcsXciU1Wg0tKUH3FoWXi3trZddC/duhJkW1uxtKlbSGwocWF201ry5v/gkY
	r6Kkmvc4wU7mgB9xHt6eLyCU+YXPV6v4SM3s2/1xDzofw2jGG4/ibS49WVbRcModROV5L5dEZ53ZT
	1r6X1w/1JLPeB8KqPKszvkifTRlgWC5n8a3ZTqgEYXyIJSVdW8jEtnMSA0myIh55ANcUIgxqhjD4p
	WhxrGAdW2a08JbFGZUSp4idu3/EKru4OMY1kveV7Hprbt4U6kVk+jDBh6WLvQz3dAvuL6tnQdd5RZ
	ir84Xbww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAyvF-00BG6s-1H;
	Wed, 06 Dec 2023 20:55:09 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAyvD-00BG5H-1V
	for ath11k@lists.infradead.org;
	Wed, 06 Dec 2023 20:55:08 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1d0c4d84bf6so1522995ad.1
        for <ath11k@lists.infradead.org>; Wed, 06 Dec 2023 12:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701896102; x=1702500902; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rNhyFZvgFU5pptzAoScDKDcqRFNRihHR3+C5yAvq3i8=;
        b=TSiw6FB9S9sKki0VSODTCcXUjoz7Cm/YhaNZyDP/FZTgm9pZIDw3lhHuthuK8+LF2R
         /yzY7EeP7vT9HeLyyZTlzDQ2UecKktte0U7Pc8KVfV9OhvmAEqoQ4Vv5cLg/BnLFRxAM
         5csJATyk8dEsS8ofZAMR4tPrOHraV5uot31ko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701896102; x=1702500902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNhyFZvgFU5pptzAoScDKDcqRFNRihHR3+C5yAvq3i8=;
        b=rKSkvOtym1DzjFCoPLbCl0T8KagEZDBkwMFSKWzAe+3jzU9yzEf6RMSQv8cG8frWwW
         K/6YJ32h2tmhTA1TOcy/zyrbJ30rXHUT1+b7nM54vwqqJFZHr+brYCx97vSfsbcjI6Wz
         Pf7IHK6DyG2beAvSyt3mPFGiCFOivu+eFbee4mbt6Yhsi+ExTv+C42WtIrlvvWx5+LaS
         zwRrD2F7wBnPdL6jhQBA8t7cORdfHFGs2w8538Gx/CAAx5oiP8kiYT8fIxurs55W70xB
         GO+AKUTtkh2Q/wD++waHqajqkAun/xKvzsz2BK5QpOMXhBSZ6dj2imbgREhefL/qgb+E
         5iiA==
X-Gm-Message-State: AOJu0YwymmXzd8lJoCOciqQWiZMhfg8r0q2MrewlDcMmdsPdQC2WzFW4
	14yj3HU/+yGt16kghXL2zLL+GQ==
X-Google-Smtp-Source: AGHT+IESvAmw3QtseZWIPzrCzbkkkb/Z+GYXQ98I6b/gn42T97kIpEWeyyjO6ixFA/04YDmDNFb3lw==
X-Received: by 2002:a17:903:110c:b0:1cf:b4ac:633e with SMTP id n12-20020a170903110c00b001cfb4ac633emr1371958plh.51.1701896102054;
        Wed, 06 Dec 2023 12:55:02 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id v6-20020a1709029a0600b001cfc618d76csm248569plp.70.2023.12.06.12.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 12:55:01 -0800 (PST)
Date: Wed, 6 Dec 2023 12:55:01 -0800
From: Kees Cook <keescook@chromium.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] wifi: ath11k: Fix ath11k_htc_record flexible record
Message-ID: <202312061254.085B4755@keescook>
References: <20231205-flexarray-htc_record-v2-1-fbb56d436951@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205-flexarray-htc_record-v2-1-fbb56d436951@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_125507_506762_A87728DC 
X-CRM114-Status: UNSURE (   7.72  )
X-CRM114-Notice: Please train this message.
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

On Tue, Dec 05, 2023 at 01:00:17PM -0800, Jeff Johnson wrote:
> Transform the zero-length ath11k_htc_record::credit_report array into
> a proper flexible array. Since this is the only array in
> ath11k_htc_record, remove the unnecessary union.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Heh, looks good. I wonder why this was a union to begin with?

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

