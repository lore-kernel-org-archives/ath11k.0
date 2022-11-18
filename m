Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C85C4332F
	for <ath11k@archiver.kernel.org>; Fri, 18 Nov 2022 12:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i34PjAq+ZyHINptKsJDpDcbFw7nBCHAOY3k+LYZnLU0=; b=IfmfOqcIACx8YQ
	chz74IPYoGZCEmdPFJI0Mmg//LVDNpccHyWetzMa0ST+SIPx1eqa7s+XRXS5Zo5H/PhAS0+CoimRn
	lujdH77hZIBVtH/9AnPcekzEUPkpqH3wqjUIgSSQgzPMaP3iBn8PdvSNOOIfvLpeCpTNdzBj785FS
	TpgtyIUQ/52CWJrq4wz4dxBbI1PfIC/+CVXI16gKFvCp6d8S4AaiiZYp7hlqgL0S1MKmnshg/YojO
	o7FlndgFFZbZ2D8xmb8JsyXRezlnyQV1bpAptDJXd4nsrZFbJLp9wR86OqQpdlhKBzikDDWq4AqU1
	t8cX77COzdLk7rKNAfiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow0nk-003ymF-KT; Fri, 18 Nov 2022 12:49:00 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow0nh-003yjs-VO
	for ath11k@lists.infradead.org; Fri, 18 Nov 2022 12:48:59 +0000
Received: by mail-lf1-x12b.google.com with SMTP id c1so8037760lfi.7
        for <ath11k@lists.infradead.org>; Fri, 18 Nov 2022 04:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9aE0TyC8uRA3SZ62A7Q763hwPhfzXmMlaOb6FTfSUqU=;
        b=CF6jqhhW/Ywto/DODTSBDMSeZnh8AeWTmagQGkauEdDvLZDTHhiQTmx8+0L3MaAdJM
         igvnc12lJryLeWf7aXFi5nl3zjrdqPUZ4ZV3z4Q/RObwaME6UL+X5ROiICnf7h1+YbVe
         +ikGjGCHys7bnX/1HWPB44LRqLQIRpfmcbzAevI7GPv5n55LvG5EPPgeA5qatKJp/rdT
         /rMx6/CEt4oPN6FCQT0DZBZXYBZaOh8rin5kKgLf/X/yadhHpvUUeKsPjjik8LyQiEIz
         b+CTh5BVZ5cKLE0tkQQ1HDVzyA6P6knfMgqsGr/MEWWSArEAEL38lrTlKn12fBiRBlYk
         L4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9aE0TyC8uRA3SZ62A7Q763hwPhfzXmMlaOb6FTfSUqU=;
        b=8BVhf1R1Ogx3F/xajkx2WJfH+Jt0xii2pDMMiK9x4jI8yFOFIO8w4tN90RMfcYQ7t/
         4a4y/OkFPBljarxuFYhJzWci1Ua2ImnCpBQUq2y1r1ikReITJHE6lf7DHiGkHnM4IEMJ
         0wPjeV6M/Z9lguZYd8RVBhuFuwSc+LiVO6cu+M8um9tT0XEGFxeeduQgAMIMsYo2p/2y
         jv/ZrkkqlPYLsj2YbgYZHhQd8m7KCrFaOBjaWVaVM3Qb9Ob88cjkoGXnUupiCQ1TkVTR
         y2eK9eFby+I748na5R9VTFcZY9yXpcfHC6TWiKkAvl4VL30J9VRKkD/m5Lpq5UJyEdyt
         20zw==
X-Gm-Message-State: ANoB5plxnO+9yFZabblHDkb3rBlBNQFSLTRDf7jDJ5yzRBL+i+RddFaI
	RlZTHRjCRvX1UaWSwsz8ae9c9OTFeJQKk/Xb4rs=
X-Google-Smtp-Source: AA0mqf4f8uCHnZaxhD7lZpmwOQ+6O+AMD/Cwoh/C2wlNml7AmOsxrVo6mcQFgBkaTpxNZLIXyUaeHWYjCNV5rMrUULk=
X-Received: by 2002:a05:6512:24a:b0:4a2:ec0:c4bf with SMTP id
 b10-20020a056512024a00b004a20ec0c4bfmr2541790lfo.164.1668775733735; Fri, 18
 Nov 2022 04:48:53 -0800 (PST)
MIME-Version: 1.0
References: <mailman.7.1667674802.1691884.ath11k@lists.infradead.org>
 <CAJrE-q7-+b_6yGAP2Aq8nNM27n0unsSFOxy6ac-ZLOkKC_caZg@mail.gmail.com>
 <28dd9e69-a2f6-2e5e-90d7-c44611d700a5@uni-siegen.de> <4660647.LvFx2qVVIh@sven-l14>
In-Reply-To: <4660647.LvFx2qVVIh@sven-l14>
From: Mariusz <enebeo@gmail.com>
Date: Fri, 18 Nov 2022 13:48:43 +0100
Message-ID: <CAJrE-q7GshGMSoiP8Vb9itUvap2=tWHqQnDFnckzcRNNpya6Bw@mail.gmail.com>
Subject: Re: Wallys DR9074-6E(PN02.7) QCN9074 refuses to work on 6GHz band
To: Sven Eckelmann <sven@narfation.org>
Cc: walde <waldemar.stroh@uni-siegen.de>, 
	"ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_044858_033265_8A778572 
X-CRM114-Status: GOOD (  21.04  )
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

Mine is from a different supplier - Wallys - and I bought it 2 weeks
ago but not sure how old their stock is. PCB looks slightly different
than Pinapple's. Is it likely to have the same issue?

What I noticed is that not only it does not have board_id preset but
also 6Ghz / 6E is only enabled (at least by the driver) when the
regulatory domain is set to US. Any other setting disables 6Ghz
channels. That is not in line with regulatory situation in EU as lower
6E bands are allowed. Intel AX210 has this right.

Also looking into their pre-compiled driver .ko, they seemed to for
whatever reason customize it. Path is far from standard kernel source
/home/wallystech/qca_ath11k/wt_ath11k/ath11k_5_17_0/

Of course I cannot load their pre-compiled driver due kernel issues. I
used the same kernel 5.17.0 but vermagic was different, I patched
vermagic plus copied symbol_table id from my 5.17.0 kernel ath11k.ko
module to the pre-compiled module which resulted in missing symbols of
course.

Not clear what they did to the driver code and no feedback of course.

Right now the only last clue I am left with is that QCN9074 has 6E on
only when iw reg is set to US. Client on the other hand forces this to
EU via LAR. Lower frequencies match between reg domains i.e. 5955
channel 1 is allowed by both reg domains. Maybe there is something
else at play that client with reg set to EU ignores beacons from AP
with reg set to US. This I cannot overcome for now, client does not
accept any change being intel iwlwifi driver and QCN9074 disables all
6E channels when reg is set to anything else than US.

Regards,
Mariusz


On Fri, 18 Nov 2022 at 12:27, Sven Eckelmann <sven@narfation.org> wrote:
>
> On Tuesday, 15 November 2022 19:29:13 CET walde wrote:
> > we probably have the same problem.
> > We have two Pinapple 6 Wifi 6 cards from the manufacturer 8devices that
> > we want to operate at 6 GHz. The modules have the QCN 9074 chipset and
> > are also certified for the 6E standard. The modules work very well at 5
> > GHZ. However the option to transmit on 6 GHz is not available. The board
> > ID is also defined as 0xff. If there is any information you could share
> > to enable the modules for 6 GHz, we would appreciate it.
>
> You have to return it to them via their RMA procedure [1]. I already did that
> in (mid) January 2022 and they replaced our cards with properly working
> versions in (mid) February 2022.
>
> Maybe you got a card from their first batch(es) (which had this problem) - or
> the problem was reintroduced for some reason.
>
> Kind regards,
>         Sven
>
> [1] https://shop.8devices.com/index.php?route=account/return/add

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
