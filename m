Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09270C54E94
	for <ath11k@archiver.kernel.org>; Thu, 26 Jan 2023 10:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eiIZm/tRx0U3K54mlclOMJy5V8mwUN0TvIkvBdE9Fus=; b=sr4Ghp3+iLRpUi
	wr7VMmYLJPC2MgIavKqlqjUsoJSEfke4XyiTHPPRH6s4WJhiQ9InyIVHZYOuGvobtE2/vt98pg7fH
	wqRkv3SrJSoA7yGdR41zApPU0SefRLpGIlKd7vYAXT47pkkaB1u+uLlZ/YqUDkaEY5KsQuKQRkja1
	bC0agb+9XcCZE2J+VoSfYPFpgJghxHT35m0G1tcUuxESLLQwCxNzemo+derQLM2uKvYJljmBLmVJd
	nAeY5m9BK9ofWgD4wRzQVNFgHA5zdgxG//WXfu6BoI0J2ZX2BgSieFoqzo+QdBo4y6H8ThqYYm4Dr
	R4DujXl3lrL8iVgitihw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKzJT-00AOfS-PJ; Thu, 26 Jan 2023 10:16:59 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKzJJ-00AOdF-BY
	for ath11k@lists.infradead.org; Thu, 26 Jan 2023 10:16:50 +0000
Received: by mail-pg1-x529.google.com with SMTP id q9so752089pgq.5
        for <ath11k@lists.infradead.org>; Thu, 26 Jan 2023 02:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N25kb8917DsEocMyJFvAiiipeCXaDAmvWVoSKk7Ucb0=;
        b=J7dO80kzV3/qF3wGrZBEcsJCeJEp5R/pt3hGmXvqpAEmso/l5D0u0sgHZ9RX0xvomZ
         2dXKQeZ7zV7XD2xGzCpF9px9ss3aPwnTXgST9A0Uwgza423jYi/HHbKXn30hs8pHiu2p
         A2YvV4WXVMrfd404HQKm2lhJdiefVdJ4hka/Wv7qWnUBsu58j6fWmc6KHywb2EbEnaO/
         xa6eVNhGPFffCvLG0vLIpx5VjW6WGgpcFIYtC3JAbXzwpovK5GFHnDCw15gLnss4zqiB
         OZ89/CLLoE1HbK/sNFKMwqmug8CSOfk1w27usyit/ZFFB+ffZtyYuWW5HfDSWLOpaEip
         1ODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N25kb8917DsEocMyJFvAiiipeCXaDAmvWVoSKk7Ucb0=;
        b=pP+vyCuhV4p19IkWVXkppkbYkw5tBy0uEoQAsOiHSziZ0U47n1JEVtX/O5Gan16ZBk
         +YorFw/1bk91SVBuPdMzBNTitAQsJwi6sQ8KtOMnpu96vfXB5MlM74ZlQzDESG9c4t/m
         Zj77+PWyHvPvivzhaNXUyoRiQNvO/I9Cv626VKxz/Qke+OmhonpglTo9oq5cZQm1wOCV
         Pc5EIWEOz2bztBmXqVw8oFSA0msjAu7FgkgIwvd/7IodLw8H9cxud2ZuejwOmBUN+Fcm
         p/YnSPScyw4tyCbwipv/ex3L+Tm4KZ7JRNZdTfTYV3GP4rwwwydU3LS+pKl0yjrgMBR8
         tqYg==
X-Gm-Message-State: AFqh2kpXMU2v2wWIJLqyDdUSQeOsKiefZLMFz9plRH8hVMXWw4GKXnGS
	wQKVJseZjLrZe4iFDMhvkCuRgA6NPrRVlTnnRfQ=
X-Google-Smtp-Source: AMrXdXuMrEBm+4oiJayh39LZrd1yppbt7a1PGYiFSqbjJHTWfkPRXLJ75/k1Yg/4x1L+XesT/pbGxb/r2VgM0gsID0k=
X-Received: by 2002:aa7:9010:0:b0:578:6897:597c with SMTP id
 m16-20020aa79010000000b005786897597cmr4172567pfo.35.1674728206647; Thu, 26
 Jan 2023 02:16:46 -0800 (PST)
MIME-Version: 1.0
References: <20230124110057.1.I69cf3d56c97098287fe3a70084ee515098390b70@changeid>
In-Reply-To: <20230124110057.1.I69cf3d56c97098287fe3a70084ee515098390b70@changeid>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Thu, 26 Jan 2023 11:16:35 +0100
Message-ID: <CAOiHx=niyEho+tJJ-dvOr3wOYiEOsvCvvJbxQvXGGoHbdxFhBQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] wifi: ath11k: Use platform_get_irq() to get the interrupt
To: Douglas Anderson <dianders@chromium.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	Luis Chamberlain <mcgrof@kernel.org>, Nick Kossifidis <mickflemm@gmail.com>, 
	Youghandhar Chintala <quic_youghand@quicinc.com>, junyuu@chromium.org, 
	Kalle Valo <kvalo@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Manikanta Pubbisetty <quic_mpubbise@quicinc.com>, 
	Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_021649_470475_3A8DAB34 
X-CRM114-Status: GOOD (  15.16  )
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

On Tue, 24 Jan 2023 at 20:05, Douglas Anderson <dianders@chromium.org> wrote:
>
> For the same reasons talked about in commit 9503a1fc123d ("ath9k: Use
> platform_get_irq() to get the interrupt"), we should be using
> platform_get_irq() in ath11k. Let's make the switch.
>
> Without this change, WiFi wasn't coming up on my Qualcomm sc7280-based
> hardware. Specifically, "platform_get_resource(pdev, IORESOURCE_IRQ,
> i)" was failing even for i=0. Digging into the platform device there
> truly were no IRQs present in the list of resources when the call was
> made.
>
> I didn't dig into what changed between 5.15 (where
> platform_get_resource() seems to work) and mainline Linux (where it
> doesn't). Given the zeal robot report for ath9k I assume it's a known
> issue. I'll mark this as "fixing" the patch that introduced the
> platform_get_resource() call since it should have always been fine to
> just call platform_get_irq() and that'll make sure it goes back as far
> as it needs to go.

Since I recently stumbled upon this in a different (external) driver,
it's likely a1a2b7125e10 ("of/platform: Drop static setup of IRQ
resource from DT core").

Regards
Jonas

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
