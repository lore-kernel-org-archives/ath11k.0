Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88981C61D97
	for <ath11k@archiver.kernel.org>; Fri, 27 Jan 2023 00:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nbrqdQrB8XXjThC+MIYs07gsn+ohvd3lLgZBskolylM=; b=If3XxzRgtID6w6
	ccsMzuQJQOm6E11GFxBpia4g7+4q19ndxfjdM9/dMOiK7qViUyi/IglXOw1Qa8UuZu54aR/ksO0fn
	9kp3gD2FkGsESVrjC51tNTPTGVF5LWwE+mp9ZRhprRIKFG3hLYjw0p4KG0JzjEcCsVG3dSB8MAdkn
	obpf7eyrwQl9WRH1iO6wlTinIryUJZt+9tb20ImPWd5CzMWVR1eO+FeXn5c3dOThaY6nWhXcHEf8A
	IM3lOsXoTHCFSRuidDobuE/IMxL1ZjpRoX3RWiVWemvQGRZXQnrKuifNR822UOn6HjNo2a7xB2g9g
	pEqWGWf6kcuqgvEqe4YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLCSD-00Cwu5-0j; Fri, 27 Jan 2023 00:18:53 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLCOU-00CvOK-7x
	for ath11k@lists.infradead.org; Fri, 27 Jan 2023 00:15:04 +0000
Received: by mail-ej1-x632.google.com with SMTP id k4so4103102eje.1
        for <ath11k@lists.infradead.org>; Thu, 26 Jan 2023 16:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m9gs0dujYLDK5Km9E6B0zUz0zQnJrvjlEkzrn/38rjE=;
        b=k+StCfZrhSYGIQk1shkv2rEzQETfPAXTVQlXYvtrSHn7IDgrZ5C+gvwr2djjaxHyIB
         sp0ahWWcmN22OMeZ9rqSuCVF7uWeulh/yJed6vw/BUC1T/fN1x2Z4VsES/HJgyTdoscA
         dxXUa2uc0n+Fm1zAqzu1T01X7FlO+xZwgW0Xc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m9gs0dujYLDK5Km9E6B0zUz0zQnJrvjlEkzrn/38rjE=;
        b=2kgjivyKaaDh/hrU0wllkuguzXNQor60FfE0a3DslXZiMVTxqVIOT/WJEvik1MFtKX
         na3xDyajB264UwAg9zA8bBreYboa6fZIP8RxRcd8YQFqsN83EcP4Wkb0rqHvlSWOYjqf
         JZ+YLo8aBGZaBklfaTM1pQ9ZRcVsVhIG1O63xymDciwZiHMM3TkLIoEB7FwuQMQwnCJS
         GznlZqS36Fb++PoheefXt9hocIAlHSK7vKAoxL+q+MMWD/XdQ8BagHxnZNm3vOsDU40G
         OtjQqQdeCaV/ZCkNOuuNU6dW1qjgg50bfRBgKm1sYQkD82afHQ+fv4bowcGJnl3jOHS7
         DYTQ==
X-Gm-Message-State: AO0yUKVZLlx+V0oeWveOINyyu8hkDEru12JT/xDjg7Imqf5A8C21tvu5
	laIqyXxvdnLlgoyqeHYHyWk3uyHsiVZoL/4yfhc=
X-Google-Smtp-Source: AK7set82SswNKsI+GYeDklkZP31tw6VFltWGAkBYmHv68ks1J9tG1l9B90r2F7rK4qU8qKRbxdO17A==
X-Received: by 2002:a17:906:81c3:b0:878:7819:b8c3 with SMTP id e3-20020a17090681c300b008787819b8c3mr3005791ejx.46.1674778498560;
        Thu, 26 Jan 2023 16:14:58 -0800 (PST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id qx27-20020a170906fcdb00b007c00323cc23sm1302168ejb.27.2023.01.26.16.14.56
        for <ath11k@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 16:14:56 -0800 (PST)
Received: by mail-wr1-f51.google.com with SMTP id b7so3543759wrt.3
        for <ath11k@lists.infradead.org>; Thu, 26 Jan 2023 16:14:56 -0800 (PST)
X-Received: by 2002:a5d:6b51:0:b0:2bf:c5cc:e1d6 with SMTP id
 x17-20020a5d6b51000000b002bfc5cce1d6mr97439wrw.659.1674778496421; Thu, 26 Jan
 2023 16:14:56 -0800 (PST)
MIME-Version: 1.0
References: <20230124110057.1.I69cf3d56c97098287fe3a70084ee515098390b70@changeid>
 <Y9LODwJPQpPs32Ds@bombadil.infradead.org>
In-Reply-To: <Y9LODwJPQpPs32Ds@bombadil.infradead.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 26 Jan 2023 16:14:42 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WEQL+Kik9ZkvtzNKN+-ofZ=-g3OzyUnnJc7PWnRzLdEw@mail.gmail.com>
Message-ID: <CAD=FV=WEQL+Kik9ZkvtzNKN+-ofZ=-g3OzyUnnJc7PWnRzLdEw@mail.gmail.com>
Subject: Re: [PATCH 1/2] wifi: ath11k: Use platform_get_irq() to get the interrupt
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	Nick Kossifidis <mickflemm@gmail.com>, Youghandhar Chintala <quic_youghand@quicinc.com>, junyuu@chromium.org, 
	Kalle Valo <kvalo@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Manikanta Pubbisetty <quic_mpubbise@quicinc.com>, 
	Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_161502_635662_7609EDF9 
X-CRM114-Status: GOOD (  16.05  )
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

Hi,

On Thu, Jan 26, 2023 at 11:01 AM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> On Tue, Jan 24, 2023 at 11:01:00AM -0800, Douglas Anderson wrote:
> > For the same reasons talked about in commit 9503a1fc123d ("ath9k: Use
> > platform_get_irq() to get the interrupt"), we should be using
> > platform_get_irq() in ath11k. Let's make the switch.
>
> The commit log is rather weak, it is better to re-state what the commit
> log in 9503a1fc123d states as it is stronger, and very clear.

Sure. Adding in the info that Jonas provided about what commit
specifically broke me would also be nice. I'll try to send out a new
CL with improved wording tomorrow.


> To that end. Why not write an SmPL Coccinelle grammer patch for this
> and put it on scripts/coccinelle/api ? Then hunt / convert things which
> will use DT as well and where this is actually useful / likely buggy.

That sounds like a great idea. ...but not something I'm going to do.
I'm not personally on a mission to track down everyone hitting this
particular issue. Hopefully those that were involved in commit
a1a2b7125e10 ("of/platform: Drop static setup of IRQ resource from DT
core") made some effort to hunt problems down and it seems like,
maybe, the zeal robot was part of that effort? In my case, the ath11k
bug hit me and that's what I need fixed. I tried to be a friendly
citizen and also fixup ath5k because it was super obvious that it was
the same issue and the same code.

-Doug

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
