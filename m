Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E58C83F17
	for <ath11k@archiver.kernel.org>; Fri, 18 Jul 2025 13:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-Id:
	Date:Content-Type:Content-Transfer-Encoding:Mime-Version:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RJXTsE2KOiSMZokrSowhZ4t+AsNAOTZqnDdpfZ+HcGc=; b=4miah5tFAVrHww+KiZZjwrqzFN
	EP+F9MHplBJPr/63/A1rEN1WtH071anlRUfqrfcItgTBdTKScFY/M+f7yJIcdxys4dLqmVFoMR5zH
	dQIo0XePJTRfVnEtv9j6KfBNGuT9ISW0vn2+vRiQhbtsIN/D88TJsAcQbsFHO7qMvdXGXvHlu9lvq
	a7OwoXggeAKEENIBrRbfLTsXK4CTHON7DSM3G6ktvxp1s3gFVhn+rT9zQG2Q/2JCtMwIOhlvmNfp9
	KXYnGsPH4bWo21Xoq0lowNZNAw96lPHOKKIjb0rnySsK16aLKvDiWD9o6tTUk3kbzlZ5kytzrmtBn
	A5uBpqoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucl4l-0000000CgP2-3jrH;
	Fri, 18 Jul 2025 13:24:35 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucl3S-0000000CgEd-42hb
	for ath11k@lists.infradead.org;
	Fri, 18 Jul 2025 13:23:16 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo3501099a12.3
        for <ath11k@lists.infradead.org>; Fri, 18 Jul 2025 06:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752844992; x=1753449792; darn=lists.infradead.org;
        h=to:from:subject:message-id:date:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RJXTsE2KOiSMZokrSowhZ4t+AsNAOTZqnDdpfZ+HcGc=;
        b=z1WulVOdePYLwNK7I3C3PkLKsNloj/RLaJaCSpPWHLMm7ZxhWj4FO8attvTiBH8Lr9
         aGe3bjHZnor383XUYvFEcajf4tyHLwMoJzrKdzKCcsf0APHKQTSL90rSCjV8crUe0Fse
         zTuqqjQPz8wIJbXn4I7BMeEbXRxeIUEGirupe+0vBVF1EZKRT3CWXXQK42LEYIOz8eq8
         NHOxfkYWf3O/53ajaXY/99iorr1S8aeORMeAEPhMxokmEOgeGBEaDDj+w4LQm/o9K6q+
         MU02ZwmTxmF9cufBZwXwhXZEsTrknmaQrU3x5KiiSxap2DRyYrWPzZe5pufxCl1Peq0K
         8f1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752844992; x=1753449792;
        h=to:from:subject:message-id:date:content-transfer-encoding
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RJXTsE2KOiSMZokrSowhZ4t+AsNAOTZqnDdpfZ+HcGc=;
        b=IQhyodyzIA3QzJFXQH5SsHu3ykmF+UXA5A8cYfSKHd0Y2jbjCuzAB/m+h1v4U48iaR
         Muw8GSTda4bGCiTgYWB5/B618MEJYUwubmT86EqB5AbVJeRAq4uzWEXuydtsfAhXJcYr
         hXqV3JWe97cUsTjC1StRZAlzuIDTl/cGj9IPo4rqZBfMnlYy4HUufCxukTRqDLzZI3YK
         2WiBM8aDVZ10f6lP9TrtzAc69zjAYO65yMFYq28aZTqSPi2uRBEoe7bEp2+OHSLBAfg0
         XBPXO1GmZgwPsejBOjiE6zDkFhSQs8XzP+AVs03WG0nX/Kr0FK+xou/3ZD1oAyIV5Gry
         QIbw==
X-Gm-Message-State: AOJu0YxqQtVg5f+6OAjniI/mYTgdUenCiKybvg3StygQOo+HLxf+6iRP
	4ihf4HBiQEvzhDPbMmQgtWWnVkWQnXu8TbXlN+Tp4GNyclhnaK1YPq6wAHGcEP9qWnrJ05zjd0a
	K3jCcVtk=
X-Gm-Gg: ASbGncsiE4jirSEA4W8rulSZh2UtCEAte0aBZxnhzN0HcSFZXe1SsPoci8UVSrmWUq8
	jRIu/j0PG0ShYxkO9jVcEuz0fNV4OfGFaImjbAn2UNnkA6J0Gubn0f39lLUhxFZ7OGjEWYVwlNR
	9Jm/u52ZU0+0pAHa3XdcnOXK3nySb6Zi94+K825BnOoHAC1MaMpTCk2rkFY5kluHQ0oDglmHFR0
	E44VVPyIdcVagfEb3ZsUytZbtGlwRqvr+qWJ6MHvwU0k58bu1yiLrWdP4Nfn19ksNfG4JBgBXi0
	6CNyBrsR3m4HchPf49DdJvBfSiIA7Q9Vv+9s65Q89+ZN28lNQNQUYHbuuMiz2UUvP3aNXtDW5ZU
	7qVAkck7FMXkt23USHbTn2xsw4eh/ykWC/6SXmjkkCmSnEcox6iPu+dc=
X-Google-Smtp-Source: AGHT+IHZo2D/DBg8hn+lB03yUXC/ioaRaeyW1DWDx5Kc7syRvpA3/VoW5y+u6rC3pfNmkDBBKHRZFg==
X-Received: by 2002:a17:907:c5cd:b0:ae3:6744:3661 with SMTP id a640c23a62f3a-ae9ce10c4f9mr829756066b.44.1752844992262;
        Fri, 18 Jul 2025 06:23:12 -0700 (PDT)
Received: from localhost (212095005010.public.telering.at. [212.95.5.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c79ae67sm121366666b.11.2025.07.18.06.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 06:23:11 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Jul 2025 15:23:10 +0200
Message-Id: <DBF7OWAWQ94M.FSCP4DPF8ZJY@fairphone.com>
Subject: ath11k WiFi bringup on Milos SoC
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: <ath11k@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_062315_021733_DD3A8FD7 
X-CRM114-Status: UNSURE (   8.07  )
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

Hi,

I'm trying to bring up WiFi on the Milos SoC (on my device: SM7635)
which is paired with a WCN6755.

There's also the WPSS remoteproc on this SoC, similar to SC7280/Kodiak.

Using the qcom,wcn6750-wifi compatible in dt makes the wpss firmware
crash soon after boot with the following errors:

[ 1263.547381] ath11k 17110040.wifi: wcn6750 hw1.0
[ 1263.577281] remoteproc remoteproc2: powering up wpss
[ 1263.814337] remoteproc remoteproc2: Booting fw image qcom/milos/fairphon=
e/fp6/wpss.mbn, size 8229144
[ 1263.817861] PDM: no support for the platform, userspace daemon might be =
required.
[ 1264.523796] remoteproc remoteproc2: remote processor wpss is now up
[ 1264.773557] ath11k 17110040.wifi: chip_id 0x1 chip_family 0xb board_id 0=
xff soc_id 0x40140120
[ 1264.774484] ath11k 17110040.wifi: fw_version 0x3014ffff fw_build_timesta=
mp 2025-04-09 08:57 fw_build_id WLAN.MSL.3.0.1-00328.3-QCAMSLSWPLZ-1.105949=
.2
[ 1272.362281] ath11k 17110040.wifi: htt event 48 not handled
[ 1273.499832] qcom_q6v5_pas 8a00000.remoteproc: fatal error received: cmno=
s_assert.c:400:Asserted in whal_wmac_recipes.c:whal_wmac_transition_to_fw_c=
ontrol:1734
[ 1273.500231] remoteproc remoteproc2: crash detected in wpss: type fatal e=
rror
[ 1273.501114] remoteproc remoteproc2: handling crash #1 in wpss
[ 1273.501153] remoteproc remoteproc2: recovering wpss

That "htt event 48" should be HTT_T2H_PPDU_ID_FMT_IND, I have briefly
looked in the WiFi driver from the downstream 6.1 kernel and while I
might definitely be wrong here, I'm guessing it's not related to the
crash.

Anyone have an idea how to debug this? Unfortunately my AMSS sources do
not include any sources for WiFi, it's just prebuilts.

Regards
Luca

