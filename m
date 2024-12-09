Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57094E7717D
	for <ath11k@archiver.kernel.org>; Mon,  9 Dec 2024 11:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qf+IKqMd4jWP7PDOCpVWhE6CrZFz+9D4Dw7c3vH6cEo=; b=WQka5qRltY4lCzzOkMrpr8ZdBx
	7rXKJzVufeqaMdeyVVz3NKwfLjWdk2/leMqXLZ7ZLFC0sKI5EX7T/YVhkdwR/sYly1TDO8UGLH+1Z
	vlYoJnUqSPdmfOcfbCVJphB504v4bjwbnYlf3jn/0YmHNK1OAgBBMuL0R5gSj2JUc5orCrymmFQU6
	acLHBh9guAsmHgixoN2LXeRIDls1q53BfgYIKivUeElMoDlkoutE9CLEmU0unJyK9FeiDBzak90Jj
	v//OqNkMHYFmVOniKmNlBZuqXImsgWWVLOjHE+jmXWTUqohZzb128wFh20/q9FUoJnwMXjswgwWEj
	X92Fx3mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbsT-00000007U1I-3ToI;
	Mon, 09 Dec 2024 11:24:37 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbrc-00000007Ttq-33AL
	for ath11k@lists.infradead.org;
	Mon, 09 Dec 2024 11:23:45 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5d3e8f64d5dso2326560a12.3
        for <ath11k@lists.infradead.org>; Mon, 09 Dec 2024 03:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733743423; x=1734348223; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qf+IKqMd4jWP7PDOCpVWhE6CrZFz+9D4Dw7c3vH6cEo=;
        b=cdP0L9GC547VSwFNh/bMGf3om40VhkWiKjFkE4+l51TvSvON8/75I0fimeb+s1BduN
         meM98EDBRWEt4FkcEKc45DPkXp1W/zfdbWp5CzXMFrwWJz2tshImzm6Lfet18KNwxBCQ
         W3laXwGZP6VUDjWkrzLpZJSZRX1Hqj/vtpuF0TAjkmm3s386LrewFN6UbiLMtuxl4+QA
         md58wopkUGsV4anbGQe/Q+3WO+XfAcagoQX8J117+VFSJmqE+fh5dI7j7RCfo+Lj46aG
         cgABcbslrJ75vpj3K/QMHpuXF4BIAAQilz6qhIDn7waeKmzUfz8d80WNXJS/F0OU21YH
         0nSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733743423; x=1734348223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qf+IKqMd4jWP7PDOCpVWhE6CrZFz+9D4Dw7c3vH6cEo=;
        b=q+9sNGYZl6JFZZhGDhJBLX1CKoIbNfkYh2dVHeoi4Hhinuu2BBmjxd1+vINnD2OZPB
         J+FS8NrXWWA53cLyHSiCM81gznyT6/S7XKGbS4/H86oz4Nb7S5WuFuRXW/izDKjv65Ec
         W+Do1YeVNxQn8vTWaAukNCWPnhBTb3g51+35ySgnUnHKVg+zuDhWUc+205brOYxuUYix
         /F/PTQLT7BvdUYBB5qkvS9MghpPfHrNsF5PU8yMMej1jVpuQSBuUkG5H/F++q894jZO0
         ynUdWXPg5N+c1l6xv5zf0WkMOoNSJte12HcayfoHjuUMSXQfunzgtM1urwkhdfH3wTbz
         xdrw==
X-Forwarded-Encrypted: i=1; AJvYcCX5c2Hwhho7gqc+/bAVSo2tNmJ29pv7LBRFkjVMRs4QTOaUDqwow2X17uelkDMnONlyRBKO7tU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxtWr44SCr+NbvIhJr/DbTEaIXIaRJY9iNoTW0Ze/4KttUM7B3h
	na2rR+mwrmEbhGh95/SwVrg6unPZgEScS1G+9bmRe+S2dRVaqLJkQwzVBSmHTYCOTatHGvg7lMv
	fQov4KciV2DmbFyp52QeiUn3y4lE+K5SA
X-Gm-Gg: ASbGncvKGIuwTsncdLJQAVp5thxllaPeh+UnjHU/nZY2x6FwkTGbsl9572l+rrm5AA6
	kY5/dv1WmNUhUL/SJ8ZtmTfa9T7RKuFv7qQ==
X-Google-Smtp-Source: AGHT+IH2cTojVaNjg6f1XOAo3y7FAUwBnB3zsEJ0j7YM43+fRPIRPXFJpkVI999WVguOEAF19y8Qup5SYSTPKeqAtOg=
X-Received: by 2002:a05:6402:51cb:b0:5d3:baa3:28a with SMTP id
 4fb4d7f45d1cf-5d3be65a53fmr10464855a12.1.1733743423083; Mon, 09 Dec 2024
 03:23:43 -0800 (PST)
MIME-Version: 1.0
References: <20bf2693-ce53-48e9-8b54-7e3273815033@quicinc.com>
 <20241203094820.106225-1-jtornosm@redhat.com> <99359cc4-2279-4a8a-80a1-d5475fd5208d@quicinc.com>
In-Reply-To: <99359cc4-2279-4a8a-80a1-d5475fd5208d@quicinc.com>
From: Janusz Dziedzic <janusz.dziedzic@gmail.com>
Date: Mon, 9 Dec 2024 12:23:32 +0100
Message-ID: <CAFED-jk--dXAoXJ9ijpnUDeD=WiW4ZeoLb45WXiVpzPvkgX12A@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath11k: allow APs combination when dual stations
 are supported
To: "Yu Zhang (Yuriy)" <quic_yuzha@quicinc.com>
Cc: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, ath11k@lists.infradead.org, jjohnson@kernel.org, 
	kvalo@kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, quic_cjhuang@quicinc.com, vbenes@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_032344_772351_6E53F59C 
X-CRM114-Status: GOOD (  19.39  )
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

wt., 3 gru 2024 o 11:57 Yu Zhang (Yuriy) <quic_yuzha@quicinc.com> napisa=C5=
=82(a):
>
>
>
> On 12/3/2024 5:48 PM, Jose Ignacio Tornos Martinez wrote:
> >> Which chip do you use?
> > Since I am not totally sure about the useful information, let me show y=
ou
> > the kernel logs:
> > $ dmesg | grep ath11k
> > [    3.659388] ath11k_pci 0000:01:00.0: BAR 0 [mem 0x84200000-0x843ffff=
f 64bit]: assigned
> > [    3.659405] ath11k_pci 0000:01:00.0: enabling device (0000 -> 0002)
> > [    3.659649] ath11k_pci 0000:01:00.0: MSI vectors: 32
> > [    3.659653] ath11k_pci 0000:01:00.0: wcn6855 hw2.1
> > [    4.871571] ath11k_pci 0000:01:00.0: chip_id 0x2 chip_family 0xb boa=
rd_id 0xff soc_id 0x400c0210
> > [    4.871586] ath11k_pci 0000:01:00.0: fw_version 0x11088c35 fw_build_=
timestamp 2024-04-17 08:34 fw_build_id WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_=
SILICONZ_LITE-3.6510.41
> > [    5.241485] ath11k_pci 0000:01:00.0 wlp1s0: renamed from wlan0
> >
> yes, you also use wcn6855 hw2.1.
> > If I try to setup 2 APs with your interface combination I get this:
> > # iw list | grep -A6 "valid interface combinations:"
> >       valid interface combinations:
> >                * #{ managed } <=3D 2, #{ AP, P2P-client, P2P-GO } <=3D =
16, #{ P2P-device } <=3D 1,
> >                  total <=3D 16, #channels <=3D 1, STA/AP BI must match,=
 radar detect widths: { 20 MHz (no HT), 20 MHz, 40 MHz, 80 MHz, 80+80 MHz, =
160 MHz }
> >
> >                * #{ managed } <=3D 2, #{ AP, P2P-client, P2P-GO } <=3D =
16, #{ P2P-device } <=3D 1,
> >                  total <=3D 3, #channels <=3D 2, STA/AP BI must match
> >       HT Capability overrides:
> 2 combinations are to support DBS and DFS.
> Combinations is correct. channels=3D2, max interfaces=3D3.
>
Small question from my side. If phyX will support 3 bands (2.4/5/6)
what this channes<=3D2 limitation mean here for APs?
 a) can I setup APs on 2412 and 5180
 b) or even can setup APs on 2412 and 2462?
 c) or setup APs on 5180 and 6055?
How could I know a or b or c is allowed?

BTW, do you plan to share same firmware (with 2 possible APs) for
ath12k and WCN7850?

BR
Janusz

> And you want setup sta + sap + sap, right?
> When up the second sap will meet error? Could you pls share the error log=
s?
>
> I'm not very sure if you add all interface with managed type, and do
> "ifconfig xxx up" before running hostapd.
>
> You can try add second and third interface with
> "iw dev xx interface add xx type __ap".
>
>
> > # iw dev
> > phy#0
> >       Interface wlp1s0_1
> >               ifindex 6
> >               wdev 0x4
> >               addr a2:42:d2:1e:89:a3
> >               type managed
> >               txpower 16.00 dBm
> >               multicast TXQ:
> >                       qsz-byt qsz-pkt flows   drops   marks   overlmt h=
ashcol tx-bytes        tx-packets
> >                       0       0       0       0       0       0       0=
       0               0
> >       Interface wlp1s0_0
> >               ifindex 5
> >               wdev 0x3
> >               addr 52:e9:be:33:6a:61
> >               ssid test-qe-wpa2-psk
> >               type AP
> >               channel 13 (2472 MHz), width: 20 MHz, center1: 2472 MHz
> >               txpower 14.00 dBm
> >               multicast TXQ:
> >                       qsz-byt qsz-pkt flows   drops   marks   overlmt h=
ashcol tx-bytes        tx-packets
> >                       0       0       0       0       0       0       0=
       0               0
> >       Interface wlp1s0
> >               ifindex 3
> >               wdev 0x1
> >               addr c8:94:02:b5:fe:fb
> >               type managed
> >               txpower 16.00 dBm
> >               multicast TXQ:
> >                       qsz-byt qsz-pkt flows   drops   marks   overlmt h=
ashcol tx-bytes        tx-packets
> >                       0       0       0       0       0       0       0=
       0               0
> > Or even this with no AP up:
> > # iw dev
> > phy#0
> >       Interface wlp1s0_1
> >               ifindex 6
> >               wdev 0x4
> >               addr ca:e5:84:22:10:ec
> >               type managed
> >               txpower 16.00 dBm
> >               multicast TXQ:
> >                       qsz-byt qsz-pkt flows   drops   marks   overlmt h=
ashcol tx-bytes        tx-packets
> >                       0       0       0       0       0       0       0=
       0               0
> >       Interface wlp1s0_0
> >               ifindex 5
> >               wdev 0x3
> >               addr 9e:4e:c5:ea:4c:e9
> >               type AP
> >               txpower 16.00 dBm
> >               multicast TXQ:
> >                       qsz-byt qsz-pkt flows   drops   marks   overlmt h=
ashcol tx-bytes        tx-packets
> >                       0       0       0       0       0       0       0=
       0               0
> >       Interface wlp1s0
> >               ifindex 3
> >               wdev 0x1
> >               addr c8:94:02:b5:fe:fb
> >               type managed
> >               txpower 16.00 dBm
> >               multicast TXQ:
> >                       qsz-byt qsz-pkt flows   drops   marks   overlmt h=
ashcol tx-bytes        tx-packets
> >                       0       0       0       0       0       0       0=
       0               0
> >
> > If I use the parameter to ignore the feature and configure the interfac=
e combination as before:
> > # iw list | grep -A4 "valid interface combinations:"
> >       valid interface combinations:
> >                * #{ managed } <=3D 1, #{ AP, P2P-client, P2P-GO } <=3D =
16, #{ P2P-device } <=3D 1,
> >                  total <=3D 16, #channels <=3D 1, STA/AP BI must match,=
 radar detect widths: { 20 MHz (no HT), 20 MHz, 40 MHz, 80 MHz }
> >
> >       HT Capability overrides:
> > # iw dev
> > phy#1
> >       Interface wlp1s0_1
> >               ifindex 7
> >               wdev 0x100000004
> >               addr 82:90:89:90:c1:37
> >               ssid test-qe-wpa3-psk
> >               type AP
> >               channel 13 (2472 MHz), width: 20 MHz, center1: 2472 MHz
> >               txpower 16.00 dBm
> >               multicast TXQ:
> >                       qsz-byt qsz-pkt flows   drops   marks   overlmt h=
ashcol tx-bytes        tx-packets
> >                       0       0       0       0       0       0       0=
       0               0
> >       Interface wlp1s0_0
> >               ifindex 6
> >               wdev 0x100000003
> >               addr 6a:ef:d0:db:10:f0
> >               ssid test-qe-wpa2-psk
> >               type AP
> >               channel 13 (2472 MHz), width: 20 MHz, center1: 2472 MHz
> >               txpower 16.00 dBm
> >               multicast TXQ:
> >                       qsz-byt qsz-pkt flows   drops   marks   overlmt h=
ashcol tx-bytes        tx-packets
> >                       0       0       0       0       0       0       0=
       0               0
> >       Interface wlp1s0
> >               ifindex 4
> >               wdev 0x100000001
> >               addr c8:94:02:b5:fe:fb
> >               type managed
> >               txpower 16.00 dBm
> >               multicast TXQ:
> >                       qsz-byt qsz-pkt flows   drops   marks   overlmt h=
ashcol tx-bytes        tx-packets
> >                       0       0       0       0       0       0       0=
       0               0
> >
> > Thanks
> >
> > Best regards
> > Jose Ignacio
> >
>
>


--=20
Janusz Dziedzic

