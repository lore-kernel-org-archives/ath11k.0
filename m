Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05ECCC47422
	for <ath11k@archiver.kernel.org>; Mon, 29 Jan 2024 12:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E20ljoxsFmC9OjWcrOT5PYxf5yi1ZSxFrX5OnrOJQR0=; b=Qn9KnGIuiQLjD4Le5LPKYBSFgy
	AjP94QduaNd/Qj2MaQMpJrG0rFrP23tm2uoGuSKVnmvZbg0IAi3HZQQRg4uZEfp17tjc6M+E9OOlA
	b6Wgc33ItY0DSgeyIRprPoaoUv17KW5s31H2EBX2PRaAz7c2YLDxxTrzFYS4iduHRRZJbkimZhX3j
	2GQOuVz4B9UubdwpaucycECt8bpSJeEH5dFNS50NdQwpMxwQoXiaHcIuwkUUkIj8S5JPOLMwhE5VK
	yeh1i2MxmsWWcv543RhQyGZiDaDgTEdS3T842i243mdhD96YcATHtxr4uxRlUK+3G71n950vfZnuu
	T0/YdfCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUQth-0000000Cd3i-2pXl;
	Mon, 29 Jan 2024 12:37:57 +0000
Received: from mail-oo1-f43.google.com ([209.85.161.43])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUQte-0000000Cd2A-3wVF
	for ath11k@lists.infradead.org;
	Mon, 29 Jan 2024 12:37:56 +0000
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5958d3f2d8aso336865eaf.1
        for <ath11k@lists.infradead.org>; Mon, 29 Jan 2024 04:37:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706531873; x=1707136673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E20ljoxsFmC9OjWcrOT5PYxf5yi1ZSxFrX5OnrOJQR0=;
        b=hK79sFyaUcqXsJFW7Ftjn4RLI3sN9Rh5HQGt2yKcHcFoakm5Z/Gnteh4vMN85ZFxgb
         z/fUs+s3I0gjcnkItV8oX+7J2ijq/JyKoq8qEx6oJNMLsyicD3s/kdKNp9ExdktQdC1Y
         LtpUo/n5WDs5wTteD8SDvjDxWKvYL24vZ4W+4fETkhkP1wZezarsUnl+ASotZV17bx9K
         DYJBfoU+so8DqoaYPFNiZaml5M6rXnh4WjcWRt4j/LKm0eO7Vtf57JlpZt9l0W0X6Nze
         rRF6agXJCtcddn0YIGmeXG5ErjZWUqkvcZUBFOZyM2JNogPtxJnlGpXkDPUCpO/sN7Bd
         0jMQ==
X-Gm-Message-State: AOJu0YzDQ1N2ejZG0vaXH5nqmNZHWLHX+w0K/aX5EX6V51T8B3i+bUKD
	QPqC375Pl/WO75g7cULKZqCCs+L3PK2y9vNzet9XuhukB+tWtjBnuNua/ixsLjAcqQ31/Wz+MrV
	GmLXHBcy+apRrl2t6cegRAzmwnKs=
X-Google-Smtp-Source: AGHT+IF4TzOQyKTVq1JITmCvWQkFxvLTGWLetNQry01izCJUwI6kK2DrPgFDaO//y+LspyrAmDcjxe6YOJSABBKvBVU=
X-Received: by 2002:a4a:c48a:0:b0:599:fbcc:1c75 with SMTP id
 f10-20020a4ac48a000000b00599fbcc1c75mr6123515ooq.0.1706531873159; Mon, 29 Jan
 2024 04:37:53 -0800 (PST)
MIME-Version: 1.0
References: <21cd2098-97e1-4947-a5bb-a97582902ead@quicinc.com>
 <CAJZ5v0inw7pZR3-fNz9H4BdAXtVawN8m7dsDi6CeBxK2tnNGVg@mail.gmail.com> <20240129123112.GA22617@thinkpad>
In-Reply-To: <20240129123112.GA22617@thinkpad>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 29 Jan 2024 13:37:41 +0100
Message-ID: <CAJZ5v0jQOgK==fpYjoQ3+=1oOzPHCasYeTyKW9NniwYUpXZE=Q@mail.gmail.com>
Subject: Re: ath11k resume fails due to kernel blocks probing MHI virtual devices
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Baochen Qiang <quic_bqiang@quicinc.com>, pavel@ucw.cz, 
	"Kalle Valo (QUIC)" <quic_kvalo@quicinc.com>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	linux-pm@vger.kernel.org, "kernel@quicinc.com" <kernel@quicinc.com>, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_043755_025138_73F8B185 
X-CRM114-Status: GOOD (  29.03  )
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

On Mon, Jan 29, 2024 at 1:31=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Mon, Jan 29, 2024 at 01:22:27PM +0100, Rafael J. Wysocki wrote:
> > On Mon, Jan 29, 2024 at 11:10=E2=80=AFAM Baochen Qiang <quic_bqiang@qui=
cinc.com> wrote:
> > >
> > > Hi Rafael and Pavel,
> > >
> > > Currently I am facing an ath11k (a kernel WLAN driver) resume issue
> > > related with kernel PM framework and MHI module.
> > >
> > > Before introducing the issue details, I'd like to summarize how ath11=
k
> > > interacts with MHI stack to download WLAN firmware to hardware target=
:
> > > 1. when booting/restarting, ath11k powers on MHI module and waits for
> > > MHI channels to be ready.
> > > 2. When power on, MHI stack creates some virtual MHI devices, which
> > > represents MHI hardware channels, and adds them to MHI bus. This
> > > triggers MHI client driver, named QRTR, to get matched and probe thos=
e
> > > MHI devices. In probe, QRTR initializes MHI channels and finally move
> > > them to ready state.
> > > 3. Once MHI channels ready, ath11k downloads WLAN firmware to hardwar=
e
> > > target, then WLAN is working.
> > >
> > > Such an flow works well in general, but introduces issues in hibernat=
ion
> > > cycle: when preparing for hibernation, ath11k powers down MHI, this
> > > results in MHI devices being destroyed thus QRTR resets MHI channels.
> > > When resuming back from hibernation, ath11k powers on MHI and waits f=
or
> > > MHI channels to be ready in its resume callback. As said above, MHI
> > > creates and adds MHI devices to MHI bus, but they can't be probed at
> > > that time because device probe is prohibited in device_block_probing(=
),
> > > finally this results in ath11k resume timeout.
> > >
> > > Now there is an potential fix to this issue which would needs changes=
 in
> > > MHI stack, i.e., don't destroy MHI devices while hibernating.
> >
> > Exactly.
> >
>
> During hibernation, the power to ath11k could be lost and in that case, t=
here
> will be no channels available from the device. So keeping the "struct dev=
" when
> there is no real device attached to the system, goes against the driver m=
odel
> IMO since we would be messing with the refcount.

But this is system hibernation or suspend and the reason for the power
loss is quite different from device removal at run time.

The device is going to be back during resume (or at least it is not
expected to go away in the meantime), so it is pointless to destroy
its representation in memory.

> For instance in the case of USB, if the device get's unplugged, would it =
make
> sense to keep the "struct dev" for the device in kernel in a hope that it=
 would
> come back again?

At run time - no, during system suspend - yes.

It is not even recommended to free IRQs during system suspend.

> The driver model as I understood is, once the actual physical device gets
> removed, the refcount for "struct dev" should be decremented and it shoul=
d be
> destroyed.

Not really.

Thanks!

