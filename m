Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD44C61CE8
	for <ath11k@archiver.kernel.org>; Thu, 12 Jun 2025 05:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W6r8e7Fw59ZWedLKYju1tRc3TQYtMZ2U4teZHPzlD0k=; b=LCxvWXzcxnRKB4BgX768gP8CvP
	De3Ob5FkixAU7p9WPdb41OO8lrWRckuEKWjE+OLbPBpak6YUEWt62w7ZkDL5nBWLK0h9vXEKPKBYs
	CpR8pV8CMy6xONmcS5iMLU0BmI04fbW7Pb4TcSm2F8a5x3vfforvmUk5V0xDKcjTx9rpTzhOGmM2V
	STdpNZiQGTl/SLa2pS5Gp8oSFYvpsEwZluxxt5wP4KOOgxIwLUeAEXlp61rd7/HhXRwC/RuRINCMx
	KHYO/soj6JlvWUHCirZOm5cEBglj4JSp4JCgs/PR9Q8BAJUoW/HM2n8IsQOUhWiYBDau8qCIKMiUi
	8n7G8x2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPa6m-0000000CCUJ-2lyl;
	Thu, 12 Jun 2025 05:04:12 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPa6k-0000000CCTf-0RcX
	for ath11k@lists.infradead.org;
	Thu, 12 Jun 2025 05:04:11 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-234b440afa7so5705625ad.0
        for <ath11k@lists.infradead.org>; Wed, 11 Jun 2025 22:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749704649; x=1750309449; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W6r8e7Fw59ZWedLKYju1tRc3TQYtMZ2U4teZHPzlD0k=;
        b=IF24BWzA/uWPwErOlkAYrZ3ozXv/wSJWUPBY042NOBCkfijIaZedSXTQaYfWD/CQjr
         EcCpkz4T44qBC3rris1K5m15tXoSotHJvBdlD2MNwJu5t1WqHm1upKuOJRrnd0W7ciUA
         HrunyVTxbSuKMUsckia/UDop8n1qMn3DLPh5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749704649; x=1750309449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6r8e7Fw59ZWedLKYju1tRc3TQYtMZ2U4teZHPzlD0k=;
        b=NPj0CHprpsjQ4PIyAZzbeMpLQCce6qYt34WKe7VqFoPr3i306z6gLR2nhyP39pT5Ey
         nw/CBbM5Q4sYbt6Qs3q3Sw55xeGpscOFUnzEAcPv3v2PXvJVDFLfxHOQP7Jmic4B640N
         syGyfPAm/9HuM/hXSlqUQeq4pwPuVS/29DTl7XhvtFan0QcnRkT9n8M5+q4rtORn2z4M
         cClzqL2C8OKqz5OzIMHAx0LyAibNrJPQw6uYIiESeAqCzrOu/DfIi6wgCnvrosGQ3B1h
         UJiMO9z3+QMy3Te7wPNadvVKy5yIgF/IEDvNT6/pbgJ1rs0tcYtIpvroHp1vRk8cprgF
         gwWA==
X-Forwarded-Encrypted: i=1; AJvYcCWoHwqLdBOdyv7cdJw7BzxdL9u/bvyoVtfDQ4jCf5qG6qTj3+edzFQ3Ynhiao31Dc9bUh22VnU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4T3cmL58Eh56F3MZimxcvhpUBo87/qnfOReCzMy5XC4WE6LrU
	vLnH+92f/xVvYOi+5tdR+LI8gPZhGzjYbJKqYySOpQVdGPahlXg/0rOlvWtxcvJjGJNrP2gzkYU
	DaFk=
X-Gm-Gg: ASbGncsSNV8VysCtAmf9XY0Y23RZAdkHyHujgaIHgZrgpKq5HmVRE5JtSjw+uJzgkFa
	qRYVBL3z8qYQEXkoh905nMg/c4ezqQf7J4pD8UzuLbwLUN+63GCxz13gV9MCoPkAxTQpP72kgqo
	9kF9SO1QZg9M35i5G+j1OoThLb7iIF/ir5xHnSvJNqIShJlG6z6ARTczoCwA7JHAPBP6aPv7Sg+
	uMOjLKkCtogBtwCcyqDQF2aLLn4IdcV3Tv9WeYoUvOcExQxH/cgt7i1k1kRtw8TpYJr7vUySORD
	Krql5FMPH826JXPJ4TP3O5uxDGtSbnAeB6ipuTlL8OO2J3sir+GwfOyK6YaAri2FEw==
X-Google-Smtp-Source: AGHT+IGeKQSxkczV8S+QUwl5tRJhb9rbzfk+IBqR9gTkUXX9tBbQqIjwP5qfbSnKVd6Bo+Y8XOZRxQ==
X-Received: by 2002:a17:902:f605:b0:234:d7b2:2aab with SMTP id d9443c01a7336-23641abc3c0mr84979595ad.14.1749704648947;
        Wed, 11 Jun 2025 22:04:08 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:68c8:ceca:d8e4:322c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e6f9878sm4753525ad.151.2025.06.11.22.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 22:04:08 -0700 (PDT)
Date: Thu, 12 Jun 2025 14:04:03 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2] wifi: ath11k: mark reset srng lists as uninitialized
Message-ID: <rxaibpgtf37w3th5lnt3w574w443yononqjoglyfktlcxe26qg@jpmtkckrotzp>
References: <20250529035708.3136232-1-senozhatsky@chromium.org>
 <5857380e-ced9-4118-b9a0-ce926b25c11c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5857380e-ced9-4118-b9a0-ce926b25c11c@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_220410_168317_D2331872 
X-CRM114-Status: GOOD (  17.27  )
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

On (25/06/12 11:30), Baochen Qiang wrote:
> On 5/29/2025 11:56 AM, Sergey Senozhatsky wrote:
> > ath11k_hal_srng_deinit() frees rdp and wrp which are used
> > by srng lists.  Mark srng lists as not-initialized.  This
> > makes sense, for instance, when device fails to resume
> > and the driver calls ath11k_hal_srng_deinit() from
> > ath11k_core_reconfigure_on_crash().
> 
> Did you see any issue without your change?

We do see some issues, yes, on LTS kernels.

[..]
> > diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
> > index 8cb1505a5a0c..cab11a35f911 100644
> > --- a/drivers/net/wireless/ath/ath11k/hal.c
> > +++ b/drivers/net/wireless/ath/ath11k/hal.c
> > @@ -1346,6 +1346,10 @@ EXPORT_SYMBOL(ath11k_hal_srng_init);
> >  void ath11k_hal_srng_deinit(struct ath11k_base *ab)
> >  {
> >  	struct ath11k_hal *hal = &ab->hal;
> > +	int i;
> > +
> > +	for (i = 0; i < HAL_SRNG_RING_ID_MAX; i++)
> > +		ab->hal.srng_list[i].initialized = 0;
> 
> With this flag reset, srng stats would not be dumped in ath11k_hal_dump_srng_stats().

I think un-initialized lists should not be dumped.

ath11k_hal_srng_deinit() releases wrp.vaddr and rdp.vaddr, which are
accessed, as far as I understand it, in ath11k_hal_dump_srng_stats()
as *srng->u.src_ring.tp_addr and *srng->u.dst_ring.hp_addr, presumably,
causing things like:

<1>[173154.396775] BUG: unable to handle page fault for address: ffffb4e4c046f010
<1>[173154.396778] #PF: supervisor read access in kernel mode
<1>[173154.396781] #PF: error_code(0x0000) - not-present page
<4>[173154.396824] RIP: 0010:ath11k_hal_dump_srng_stats+0x2b4/0x3b0 [ath11k]
<4>[173154.396839] Code: 88 c0 44 89 f2 89 c1 e8 3a 14 06 00 41 be e8 25 00 00 eb 6e 42 0f b6 84 33 78 ff ff ff 89 45 d0 46 8b 7c 33 d8 4a 8b 44 33 e0 <44> 8b 20 46 8b 6c 33 e8 42 8b 04 33 48 89 45 c8 48 8b 3d 45 a3 a0
<4>[173154.396842] RSP: 0018:ffffb4e4dceefc50 EFLAGS: 00010246
<4>[173154.396846] RAX: ffffb4e4c046f010 RBX: ffff90d1c3040000 RCX: a0009634a5d28c00
<4>[173154.396849] RDX: ffffffffb0279d80 RSI: ffffffffb0279d80 RDI: ffff90d2e5d17488
<4>[173154.396851] RBP: ffffb4e4dceefc90 R08: ffffffffb0249d80 R09: 0000000000003b82
<4>[173154.396854] R10: 0000000000000004 R11: 00000000ffffffea R12: ffff90d1c3041c90
<4>[173154.396856] R13: ffff90d1c3040000 R14: 0000000000002828 R15: 0000000000000000
<4>[173154.396859] FS: 0000000000000000(0000) GS:ffff90d2e5d00000(0000) knlGS:0000000000000000
<4>[173154.396862] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[173154.396865] CR2: ffffb4e4c046f010 CR3: 000000005ca24000 CR4: 0000000000750ee0
<4>[173154.396868] PKRU: 55555554
<4>[173154.396870] Call Trace:
<4>[173154.396874] <TASK>
<4>[173154.396883] ? __die_body+0xae/0xb0
<4>[173154.396890] ? page_fault_oops+0x381/0x3e0
<4>[173154.396896] ? exc_page_fault+0x69/0xa0
<4>[173154.396901] ? asm_exc_page_fault+0x22/0x30
<4>[173154.396908] ? ath11k_hal_dump_srng_stats+0x2b4/0x3b0 [ath11k (HASH:3de7 4)]
<4>[173154.396923] ath11k_qmi_driver_event_work+0xbd/0x1050 [ath11k (HASH:3de7 4)]
<4>[173154.396942] worker_thread+0x390/0x960
<4>[173154.396949] kthread+0x149/0x170

