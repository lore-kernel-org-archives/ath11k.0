Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B7CC433FE
	for <ath11k@archiver.kernel.org>; Sun, 20 Nov 2022 08:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kL458Kw1LkZKH9cM3MazxhkTZn7REkCKF7aHfZYIsGo=; b=zoJV2iBeWpKPyg
	KQg9uDbFFpUSfna5e1Y6eSp9CoD+9BHrjo2/qksg1QlAQsFF2eTczKFg6WH3BK5KIpF9UrQfcL7hO
	/pqKxWibzARviBA6Po3kL1udJmifM5YhhuBK5z2ViVfiurOZxUZufGMA8Hq3dm5i64l+bG5PRUuBE
	hJgAN53I/XpMX5guGiNn+72rqTzbBSRkyAqQRl1r9qfJu3GD+Fqob/mnwAbSe8RjwtI31tMV6TMsH
	jg2q0J5w0SzQRadVf7I0sRlSuLm/Ji5Asd+1aQIN8B9ZvlI81tPmmcgv+9shuZXXhV/Ut9gBk6Dbk
	X70Im9dHdVtfcAlLvtgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owfSE-002zs2-DV; Sun, 20 Nov 2022 08:13:30 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owfSB-002zrW-9S
	for ath11k@lists.infradead.org; Sun, 20 Nov 2022 08:13:29 +0000
Received: by mail-lj1-x22c.google.com with SMTP id s24so11449863ljs.11
        for <ath11k@lists.infradead.org>; Sun, 20 Nov 2022 00:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ESOG36Ho2ZT6yXqrz5s1bMp/VeSG+VVt6PUDn1qpyLQ=;
        b=qV/RndYc3z4j5aylkXFUGc8nJNAlYt2ONkXyvlpn15vtOcEbOFA3FEpXCVtZ69XR4m
         IklSGIJy1rcDp2osEDkO3TGZMdBQ0g3srynRV5b7BAUr74tJJT65FFpw8YLoNpMe/2hw
         bT+lkzf3DSCkFHo4b1q/7H0ef1fqGmOm227smxYFFnyY9Uph0a45glVjZ5fGyKvtn/uR
         cKby2dU9TKddhZBUZV+bEU8SPX1er2SZdMTdTG46OFnYTUDCqS94HERGuZ7It/UFbqzw
         i4Z59Vcd4o7Py2ReLLDDFtRNaz1NcPAQQ1OQqChtQAfUhJkHW/GRXVa+lLKheRUPdNYz
         Qk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ESOG36Ho2ZT6yXqrz5s1bMp/VeSG+VVt6PUDn1qpyLQ=;
        b=BRin79Kac/FSJcwiMnCDtv4ykNNm0lNiI0/TobzHsdhYZBsd/yV0G9QaPKm6DCT7ck
         CZmaa2oWUwQxCU8ft3H0FO7tmq73LR6UtOcQyrbbQcZLGL2tXl2q9Hl8aGEO4ffzu//Y
         N3/C0O3gmfqRLASRK/OKJCS91rc20KDjo2kW/IdMCmOSfKo+tTzbXUNbAi+tNo4hD37Y
         jM6w0U+KCNbZ2rNE3HWZXa1BbdhxdHrouMSZAp3+6uQLjDMLTVmZPy57v/g9xhKLk/J1
         XblinRbrqHefhBC+NX5Q7tOPWvNrVpPGNpBrUJnThKKX3sjIsVHyGwxKqS4aK1gMCDc7
         G+vw==
X-Gm-Message-State: ANoB5plKB7qIO3QJ4tEGpPT3mPzVlezjjFWnhB7pv++3BBtv6/SaudY8
	04wiYBgGMa/bUERhCetJVS6i5ldjdz3rKs/3gsKjX6jWpxE=
X-Google-Smtp-Source: AA0mqf6DYKZatHhpK80rXcTGsRzkrvyZLlnvgNCp7tPdKMgywil95xX+vWiYyv+HerC1tAq5wXGEyrYTk/RGmp+2NJs=
X-Received: by 2002:a05:651c:2050:b0:278:eef5:8d17 with SMTP id
 t16-20020a05651c205000b00278eef58d17mr4453746ljo.205.1668932004873; Sun, 20
 Nov 2022 00:13:24 -0800 (PST)
MIME-Version: 1.0
References: <mailman.7.1667674802.1691884.ath11k@lists.infradead.org>
 <4660647.LvFx2qVVIh@sven-l14> <CAJrE-q7GshGMSoiP8Vb9itUvap2=tWHqQnDFnckzcRNNpya6Bw@mail.gmail.com>
 <3684626.iIbC2pHGDl@sven-l14> <CAJrE-q7yW435fPqeNg9aEhbdyy152Q2q-dSbQ7_4xNP9EzHWHg@mail.gmail.com>
 <CA+HBbNGWQCR_RQK3iCX3cEHeMzMeKz6pdwG9=LrOw8fSB22x2Q@mail.gmail.com>
In-Reply-To: <CA+HBbNGWQCR_RQK3iCX3cEHeMzMeKz6pdwG9=LrOw8fSB22x2Q@mail.gmail.com>
From: Mariusz <enebeo@gmail.com>
Date: Sun, 20 Nov 2022 09:13:16 +0100
Message-ID: <CAJrE-q41T-A0My_+wRauGW9CQh53U7CLP5L9vNNMKtS4nEvFgA@mail.gmail.com>
Subject: Re: Wallys DR9074-6E(PN02.7) QCN9074 refuses to work on 6GHz band
To: Robert Marko <robert.marko@sartura.hr>
Cc: Sven Eckelmann <sven@narfation.org>, walde <waldemar.stroh@uni-siegen.de>, 
	"ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_001327_374975_2E2B9018 
X-CRM114-Status: GOOD (  42.26  )
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

I also got my hands on AXE75 which is a 6E router and I am able to get
QCN9074 work in STA mode.

With 160Mhz it did not work but it may be anything. However with 80Mhz
I am able to get a successful connection fully authenticated with
WPA3. So radio wise it operates in 6Ghz band after driver patch with
board_id=0xa2. Now I'm trying to understand why it still does not work
in AP mode.

root@s4:/home/angel# wpa_cli status
Selected interface 'wlp6s0'
bssid=1c:61:b4:c8:93:f4
freq=6115
ssid=test
id=0
mode=station
wifi_generation=6
pairwise_cipher=CCMP
group_cipher=CCMP
key_mgmt=SAE
pmf=2
mgmt_group_cipher=BIP
wpa_state=COMPLETED
ip_address=192.168.6.123
address=c4:4b:d1:d0:00:7e
uuid=07aaca38-a259-53ef-b12b-bb4cf5dad8d8

On Sat, 19 Nov 2022 at 16:16, Robert Marko <robert.marko@sartura.hr> wrote:
>
> On Sat, Nov 19, 2022 at 2:40 PM Mariusz <enebeo@gmail.com> wrote:
> >
> > I have contacted Wallys again but I am skeptical about resolution.
> > They don't consider board_id an issue and provided the same response,
> > on integrated systems it is due the bootloader to set it properly so
> > it is not fused and obviously not included in x86 scenario.
>
> Hi, this is not really the case, how would the bootloader set the board_id
> which is supposed to be fused on the device so FW would report the correct one?
> You can only workaround that by hardcoding it in the driver or on non-x86
> in DTS and force-loading the correct BDF that way.
>
> > Since this
> > is a private project I doubt QCA will support my efforts and free
> > access to their portals gives nothing. Found online some SDK for
> > version ath10k/IPQ8074 and athtestcmd to deal with OTP/fusing but
> > that's far beyond home project effort.
> >
> > Tried also to compile it in OpenWRT with moderate success. ath11ko /
> > qrtr.ko modules are built but the module never goes past power on
> > success.
> > mhi mhi0: Requested to power ON
> > mhi mhi0: Power on setup success
> > mhi mhi0: Wait for device to enter SBL or Mission mode
> >
> > Even the newest kernel in OpenWRT master development branch 5.16 is
> > quite behind and backporting anything is another non-trivial task.
>
> ath11k won't work in OpenWrt master currently, I have been supporting IPQ807x
> and recently PCI version as well out-of-tree with hopes of getting it soon into
> OpenWrt once 6.1 backports become available as that gets rid of like 300-ish
> backported patches.
>
> Regards,
> Robert
> >
> > On Fri, 18 Nov 2022 at 15:06, Sven Eckelmann <sven@narfation.org> wrote:
> > >
> > > On Friday, 18 November 2022 13:48:43 CET Mariusz wrote:
> > > > Mine is from a different supplier - Wallys - and I bought it 2 weeks
> > > > ago but not sure how old their stock is. PCB looks slightly different
> > > > than Pinapple's. Is it likely to have the same issue?
> > >
> > > It definitely has the same issue (because you reported that board_id is
> > > 255/0xff) but I have no idea whether Wallytech ever fixed it. At least I was
> > > never in contact about this problem with them. But sending around precompiled
> > > kernel module binaries (for an unknown kernel build), with some hacks to fix
> > > their hardware production errors (missing module id fusing in the OTP for
> > > their separately sold modules), doesn't make me confident that they are able
> > > to solve this problem correctly.
> > >
> > > In their defense, QCA doesn't make it really easy. It seems like their
> > > reference designs with Pine on 6Ghz are (mostly?) for (embedded Linux) APs
> > > which use the normal flash (NOR or NAND) to store the calibration data. And
> > > for these devices, they use the devicetree (or various other hacks) to load
> > > the correct board data.
> > >
> > > Wallystech has to find the correct document on createpoint which describes the
> > > process. It was something like "module" "board id" "fusing". But it is not the
> > > "Board ID Fusing for 802.11ax WLAN AP Chipsets" which only describes the way
> > > how you would to it for thei internal wifi of the IPQ807x/IPQ60xx/... SoC.
> > > You/they are searching for the corresponding document for Pine IPQ9074. Most
> > > likely hidden in some QDART documents.
> > >
> > >
> > > Regarding the problem that some countries are not allowing 6GHz: You have to
> > > either get a firmware from QCA which has it enabled or you modify the BDFs
> > > ("board-" files in the board-2.bin) to enable 6GHz in the (enabled) embedded
> > > REGDB of the BDFs for the specific country. Unfortunately, the data structures
> > > of the BDF are not officially documented and you would need an official QSDK/
> > > ATH.11.X release from QCA to fetch the bdf2txt.py, txt2bdf.py and the
> > > corresponding template for your BDF to extract and modify it.
> > >
> > > Kind regards,
> > >         Sven
> >
> > --
> > ath11k mailing list
> > ath11k@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/ath11k
>
>
>
> --
> Robert Marko
> Staff Embedded Linux Engineer
> Sartura Ltd.
> Lendavska ulica 16a
> 10000 Zagreb, Croatia
> Email: robert.marko@sartura.hr
> Web: www.sartura.hr

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
