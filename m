Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E683DC02181
	for <ath11k@archiver.kernel.org>; Mon, 20 Jan 2025 15:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EwM8vHrZfCJAlWd3az/ynReLWW6B1QyqxoDvOuugtXw=; b=X5IVdWU7oVN+xfuwWn3oSy7q7O
	gCgxi+X+khsrpDZlHYuSgUCN/ZWwCoSWBJlC2oEknmnkFbWQKjUCMdZD6uqyuuGQ/0SmrjeFRf29L
	cNylC7qVCT/jXpAvA+PC+cMwRSkHV9onztgip44c3SjcirxajbBt25X4JwbzH8OwevpQ3ANsebyYo
	Ukn9qma/rJqC+tjiuM+6NEs5f8MOdCmCe1XmiISienDnSZJALzsXF/KGZOa1l9jpt0PoBNpE0iAzu
	/CjWrbydY0G/hCh6eEtxZYjtFeofwHBMIec72ycq80Fik3KD3HM6je9pVgcKJA5xkY1HxZRU0MGXD
	QQ2hFU0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZtjZ-00000005tJ9-0zVE;
	Mon, 20 Jan 2025 15:30:37 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZtjW-00000005tIW-3GxI
	for ath11k@lists.infradead.org;
	Mon, 20 Jan 2025 15:30:36 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4362f61757fso47318355e9.2
        for <ath11k@lists.infradead.org>; Mon, 20 Jan 2025 07:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737387033; x=1737991833; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwM8vHrZfCJAlWd3az/ynReLWW6B1QyqxoDvOuugtXw=;
        b=P2Dr0JOKxGLnl+C9sNmQziAgam8X3SjJQUXKYUNCz2K/o9GR8xYBJvtoLNeN36pFE3
         sBgifKEUX+/gJJ7o1PhdyJHd1fCtpiTTBdNdpkzOGL03QdnmBwTt/6myjf2WKolLGxTG
         +6RnsJA52VCOj/0d/K9rg4PXpCYSGZa/VFy9u+MIPGDjuTzKgYVAZiWewsXr4GlEGrew
         enKCnJF9vGXVaUp+EFmr32Xo8gW8HK6yrtz3kRy+myfdxmyd5nYzWqw17oVWJO3WTg3i
         0qL9D4Kd9ZjcXzN2cnF/vra4N0jZb9hDFKDMJB52WihKZnfV8xhYA0lOzZDC+wYGSsMM
         Mutw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737387033; x=1737991833;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EwM8vHrZfCJAlWd3az/ynReLWW6B1QyqxoDvOuugtXw=;
        b=rr4eJzmW25gPJ7R1pcvQJ5K0lpB2G2uiyaWkImJOjCIKiy2FfeVYcIs68DgsXDILNP
         9+l+x0hp9DXB5a0PQ3BklPT5H0rjtLeRZR+kc9k2laC0kFV7pJ/VEtDkS3dprH/9FxKY
         gmws4ARa5o7cnTTvpuGzaQ0d1KrXtGM8VXD3kB2C9PfUpfDvXOTcr7iaNq+NPQYmbU/n
         QVKLKYvN583C7vJqXvj/+Gx43a5DBa68jQZ5gNiope/Q1PaX+jRnq7T0LKnFSXlFkbQi
         HYyaef4llBe386/p8AkkhuHRxY4hq52ijjBpXAen+mDxDoTd/TYPI+KutSmZ7k0D+Zfu
         Y14g==
X-Forwarded-Encrypted: i=1; AJvYcCVd+LYFbPHBf9xUxGrTp7p1mN+gIoov99FOQqN5tb8d6ugK8jLaDwxvLbSZmWNsyFqZbHQKTiA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwtsmAoEv02c1SNfgQRqMxz47Gv9IxJfLd3CLu6yoSEd3Zo3BxD
	R5EBgigAMlknSkFaL4EwMh6rpzOQdIn4hW2P/kbfsyW8ZhmiebgS
X-Gm-Gg: ASbGncuIGia0az6FFpUCV11IJFZmCnpCWj6o17Ujhal9fx1DXYtyBswAne0+6k0aElx
	0WwNYLzwvC4j1/XCSTYy70dkBBXFTvVJ+hA+ovlUJB3dL2vxBZ8Ilb2uSJsq6pDJdpnVvJ7wVK/
	UmQStVMgN66F7XYuGYfSU2EvNojs8NL5f7ICD5VPcG4Yq4CnZqz6ZY69fzyFWJJH/zYRQZtkeUn
	4ZjN8xLLqJEnphLubPx7O7qWYe1p71qsmgdo2azcYHfdjitL8TjYGaXO/+c14k7AMHOq99FW0Vh
	Sd0ilMfzu5cp
X-Google-Smtp-Source: AGHT+IHlyS8zLwt9rBRW+YcPDUyrHptF0iC0oVkb9na2U+vQHP3IKrzOIXgQ21MR6UbQ2DPnb1DKAg==
X-Received: by 2002:a05:600c:1da1:b0:434:a815:2b57 with SMTP id 5b1f17b1804b1-4389141c4ebmr106120285e9.20.1737387032338;
        Mon, 20 Jan 2025 07:30:32 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74c6ceasm204514095e9.24.2025.01.20.07.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 07:30:31 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jan 2025 16:30:31 +0100
Message-Id: <D770AVPQZXIW.26SXMNNQTQ1PZ@gmail.com>
Cc: <linux-wireless@vger.kernel.org>, "Steffen Moser"
 <lists@steffen-moser.de>
Subject: Re: [PATCH] Revert "ath11k: clear the keys properly via
 DISABLE_KEY"
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Vasanthakumar Thiagarajan" <quic_vthiagar@quicinc.com>,
 <ath11k@lists.infradead.org>, "Sven Eckelmann" <se@simonwunderlich.de>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250117191455.3395145-1-nico.escande@gmail.com>
 <20e0a239-3d23-473b-5bc8-41bc25a64088@quicinc.com>
In-Reply-To: <20e0a239-3d23-473b-5bc8-41bc25a64088@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_073034_824106_113ACB03 
X-CRM114-Status: GOOD (  18.09  )
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

On Sat Jan 18, 2025 at 11:29 AM CET, Vasanthakumar Thiagarajan wrote:
> Hi Nicolas,
>
> On 1/18/2025 12:44 AM, Nicolas Escande wrote:
> > This reverts commit 436a4e88659842a7cf634d7cc088c8f2cc94ebf5.
> >=20
> > This as been reported by multiple people [0] that with this commit,
> > broadcast packets were not being delivered after GTK exchange.
> > Qualcomm seems to have a similar patch [1] confirming the issue.
> >=20
>
> This will re-open https://www.spinics.net/lists/hostap/msg08921.html
> reported by Sven. The recommended ath firmware ABI during GTK re-keying
> is SET_KEY instead of current DEL_KEY followed by SET_KEY. We are looking
> at other options like some marking by mac80211 for the driver to be able
> to identify if the received DEL_KEY is for re-keying. Also I'm curious
> if roaming between secure and non-secure mode is a critical use case.
> If not, we can probably go ahead with this revert as temporary WAR,
> @Sven?
>
> Vasanth

Yes, indeed it will make the original problem appear once again.

But from my standpoint, switching from encrypted to unencrypted traffic wit=
h a
config reload (without an interface restart) is not so frequent of a usecas=
e.

On the otherhand, GTK rekeying is much more frequent. Like once per day wit=
h
hostapd's default parameters. And from our tests it fails around 1/4 of the=
 time
with ath11k. So for every 4 days of operations of an AP running the unrever=
ted
code, you won't have broadcast working for one of them...

I would really like a proper fix from QCA, but in the meantime it seems bes=
t to
revert it IMHO.

