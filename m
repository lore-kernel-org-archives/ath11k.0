Return-Path: <SRS0=tLkO=GF=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84877C433DB
	for <ath11k@archiver.kernel.org>; Sat,  2 Jan 2021 23:50:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18848207A1
	for <ath11k@archiver.kernel.org>; Sat,  2 Jan 2021 23:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18848207A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=60E5qiaBzptrKiAzrFPZhVi+HVV3YnvB8o4slMWixBo=; b=3TrpBufOReeP0uMFQishMkGhs
	JBQTZBDUKHMjxrbM8ACe0wKl5u19QoPA83J5ylI009YT2m2w7a4eL6ShdvPLL1+CVfVT2+sxctznd
	Ru8lE7p/VpGl+voH5SULyecX4NcCiww6p4RThFdVJZ3RNoyFAdHC3A7EnPrbYK6D0WtibIAF2WpG1
	syUPfo3ApSIjNAvg/9AB6CgazViR0RDJMHzy5vZpFMqysYy/ehR2v+UdfwabsL9TjUeQ/ecS9drD0
	5VKSvBK9aWDODEI6ZRYYNmyIKBKCON0ESuTGZkreSjPX9ScO1yotG9v6QwATHKqC9fwkfr7Gmxwpc
	YzRry7nEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kvqev-0003VM-7Z; Sat, 02 Jan 2021 23:50:09 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kvqdM-00032s-2X
 for ath11k@lists.infradead.org; Sat, 02 Jan 2021 23:48:33 +0000
Received: by mail-il1-x134.google.com with SMTP id q5so21974454ilc.10
 for <ath11k@lists.infradead.org>; Sat, 02 Jan 2021 15:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=rU5QM1CDUO1YgkzgrbuDDCA2BAU5bRA0PesTaPSTo5o=;
 b=LCLcEFCqcHmODd8twHTto99NjJWnEsnPUpg+gTD3c0D4zO1wNdVZlnniDjRWGPM0As
 ow46byKGly2fXL9BICPFL438NQzekkL5Z+GL0QH/6P5njBddbiRJJyKQdwMu0Dzqet8V
 pHEV5OJaaGEylvB24q2qsh39pczvJtZDspBZIsbIaBeyp8j9/QESg4/U3P+Zt3FbKBNd
 uZytxzwk7sDXNnrOtR27DholBmY2ZGRQxGEKHeP2u7CT/sCjJxiqMDtvHSycge07sHZe
 OOJ5NzVJQfg6u9lrRKd3DLe9k0dIjo6yDqH4ar+1y0zojwKSkyGhjMB2R+vixO2a7bNl
 SS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=rU5QM1CDUO1YgkzgrbuDDCA2BAU5bRA0PesTaPSTo5o=;
 b=IPJRnQwOcyr6Nm0J+pbJEtrpyib8LZM0h+XpSkUtoTShSakOFSMkgyyRrAGdQXztea
 bPedFDaFM4KayVqou6pED9CZRhN+7x7k16zRA50LKkTZS1g5aELQSPRJOSMOjDCLoLQT
 +lwC4Btkpmau+y3/Ve7HAbLv9X8YPAOvTZFljpJzIWySK1Sf+Hc0alJ+YsbOHHIY2Uku
 fSn9JmBQhaGdcJhjnTpsDK0NDVnHwQf1KtUKglcPK9A+72n5BWLy4Lv19N4rivymQlKi
 j2Utcx6BNgTZtGtsoVCngZsquqFuemmnE3ljeDb1CWKkl2ik0IoRwhHAepsME7y5QJ3W
 Kd1w==
X-Gm-Message-State: AOAM532oFLpRYU+VWHaFzfTnVqdz43tfwguhPzkNWsX0vM/tfKtsNozq
 Me+jOidy8FYPaDk2Cerd39MVE2E/uQxSr+PfwhruViDjz2GXCg==
X-Google-Smtp-Source: ABdhPJxxM0Z7BpcPc7x1nSGichq4ABDfj3BDYbuquAPnZPpbz0MCavE/D9b+puvRr/wwoM9J5w0qgKkTFP1AFHxBURI=
X-Received: by 2002:a92:dc03:: with SMTP id t3mr66762634iln.215.1609631308337; 
 Sat, 02 Jan 2021 15:48:28 -0800 (PST)
MIME-Version: 1.0
References: <CAM+r-RhxY4TA4zPm6e6ah9RWdBY67J=5oRS3+=+EQMomKa10QQ@mail.gmail.com>
In-Reply-To: <CAM+r-RhxY4TA4zPm6e6ah9RWdBY67J=5oRS3+=+EQMomKa10QQ@mail.gmail.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sun, 3 Jan 2021 00:48:17 +0100
Message-ID: <CA+icZUWcuka-6j139+89pSV5Z-r1fYVriz+wJE0gma4RO_PL9Q@mail.gmail.com>
Subject: Re: [BUG] Stacktrace in ath11k_pci
To: Luca Versari <veluca93@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210102_184832_329429_69646071 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Reply-To: sedat.dilek@gmail.com
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Sun, Jan 3, 2021 at 12:27 AM Luca Versari <veluca93@gmail.com> wrote:
>
> Hi all,
> I recently updated to kernel 5.10.3, which has the module for my WiFi
> card (QCA6390 - Hardware name: Dell Inc. XPS 15 9500/0XWT2F, BIOS
> 1.4.0 08/14/2020).

I have no ath11k hardware but looking at the commit logs:

$ git log --oneline v5.10.3..v5.10.4 | grep 'ath11k:'
6003ff9ca725 ath11k: Fix incorrect tlvs in scan start command
01c0691ead1e ath11k: Fix an error handling path
08c7e5615496 ath11k: Reset ath11k_skb_cb before setting new flags
345511c3f496 ath11k: Don't cast ath11k_skb_cb to ieee80211_tx_info.control
7688ca1121ba ath11k: Fix the rx_filter flag setting for peer rssi stats
00f7592609c9 ath11k: Handle errors if peer creation fails
8a8fe3e58c3e ath11k: fix wmi init configuration
e3f640e6a085 ath11k: Fix number of rules in filtered ETSI regdomain
ce79baf7b3eb ath11k: Initialize complete alpha2 for regulatory change

Upgrade to Linux v5.10.4 and check again?

- Sedat -

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
