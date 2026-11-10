Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186E960A2601
	for <ath11k@archiver.kernel.org>; Tue, 10 Nov 2026 06:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1O9uVQ6H;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=thnEnBBt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FNCN9F8ROMGrrVoJ7iFWkLhPaPG6W+ai/dJpDmC52jM=; b=1O9uVQ6HjIHVz9itGs7JJ39yVy
	18eKnGJXEVV8DG5OAvlT2W11pWWHzKgvAAavGanwvu1od39sbFi1lQh4Zx7B72+CY9hOi6cFEX7Ck
	SFpib5oQM+b6LUj33NU/YSQt9Hb+5sydimekCNVhKNtgKp++cHGBnCl+y8NMd+ka2sno+qugApoo7
	xl72g7HHh0a5APnJR09QF2gxY1XeuP+vnKwdnmTfa/2+QSpWye5wsEQUl8Yku9h7QdLJTI8WXpkwS
	s2tyg5Mp4sKvCWJuls0Sub9UzgrNZ0mSRcniyqgz6qasELBdQiqbKz0C4dI/tPfdWZYaXynUfjasP
	kFqjTq3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfnb-00000002j2C-2WB8;
	Tue, 10 Nov 2026 06:57:43 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfnY-00000002j1Z-4AaX
	for ath11k@lists.infradead.org;
	Tue, 10 Nov 2026 06:57:42 +0000
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-99b49d6a5caso368135241.2
        for <ath11k@lists.infradead.org>; Mon, 09 Nov 2026 22:57:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794293860; cv=none;
        d=google.com; s=arc-20260327;
        b=IcOy843F1AEl0sfmrMc9mjtYuYnpB9sm/gz7z8+12Dc3mdiQAt7EkVoR5VubT/D0hz
         Y4OSR8Oibj8gwxz6Fmekd0+joz1Oqonx6RvD6PAm5ndybZ+jhqvC7zMh38MaQn/sbdI4
         IcHk2EaUgAJNI3ui3P2R1EXA8429A7axYMVEuslWKbJ8AuUY3MkxUbmjH6oEoY0SNdQm
         qnaqxp/DMfCc8jK8exxMMW3EHc/cvzGm+3UAU5Fz9h0IkCMzA0K1bCfpaS8idOjA8GeV
         Z00WwLQD8KafbYpndDqmZON92kRyuAlDF0DXONe9hIGcFITW+fL2Y1BkdqchSaGjWt1K
         46bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=FNCN9F8ROMGrrVoJ7iFWkLhPaPG6W+ai/dJpDmC52jM=;
        fh=Zvs7Gq+yutMvDPM1m3SyZp9COm104iwxknPzo50lUC4=;
        b=Pm2L+6jaE3If2H6vj5nT/u6/x/2FD7VmoggEFrF2xKkJgXdKdT6mP571pEPANg3TQ/
         cRxI2qc4h5RG9dPwBslpDa7W8EyvE3WJCf8rKch/+vQtZa7m29ioYZOF4THvq1oZKylh
         3mHTX2VClXepgLvm0o+S7+DpVnq/Xy+d+WBmSXGsMci+HBOUBgWD+csbS7Fcyo6OOgpd
         hNkmX5TSQbogvE6A5e/VMbKgM366xGODqGteVH3Crugf27umdd3PqS4KS8YNI34ZQ1XF
         dQo4E1SQfPtFXzQXT+06EK238f7CEMT/tuDW6Jw5PL3G2bpK13TAcZeVyW7HLF/ki9q+
         4eLQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794293860; x=1794898660; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FNCN9F8ROMGrrVoJ7iFWkLhPaPG6W+ai/dJpDmC52jM=;
        b=thnEnBBt0/+Ch/nD1F+p3SU6LJjNgKra5PNYUb1uXQQ26wzm2VhPdkMM2WsXw+Epcj
         Vp6NOuAkquYucxaqxjS1vj9IEdoTLggaU3TV1urxGl7Pec9oTUpY6znIuh/7h92NmhZB
         irpL9BbKXNL6Dpyi+SpNuNdRRJRKITgC9JF91bwow/e1LfeZdufd/2QTMDPb58aJ9QiP
         7RxMa3PY3eD1Z0ZSpxQtJJCiIhFL5WSPnoqzwb6/DqA3NtfYMSyJi7eMsutmnRZQQ0Qj
         RirvaOgoeIcrsrt3qCw14gwRs0cklEfsoAjravLV7Mbo49uox6qL0TXWrt5mdUWQCHKZ
         TCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794293860; x=1794898660;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FNCN9F8ROMGrrVoJ7iFWkLhPaPG6W+ai/dJpDmC52jM=;
        b=0lSFQVPe1v1s/g0Tw14YJa4N95wzYiVBjTODB47QTcfnjlu+TtAl8M6Y/cYLBDsPzu
         m7mkILPzqBlqaFVdXhiGSPy2wVCOt9RipJZu6JLRkYMnFqp5i5cC9aRbMdk+jGGgFbOi
         LENCnZGgV7CDIX4Jm5ENNN8M0+G51UPi7GTD4pCfURNWJCzwsdSqt3rYdAE/ntqiDwqG
         l9eS5JxnqV4+oRtI6cmcEHQFeQv6unJYWhkkSQjqmrw8wk/a3krO9NK0yW8HxDcaj3I/
         XLvnQVtF4JEo32TJ1tbOck+QRNEhqLAjbmu/FMqe8TKLAV3BeOkqEF2HXXKIBHVmBLcn
         bUtQ==
X-Forwarded-Encrypted: i=1; AL+hErH6i3ZyzuxvbKGKzN427ih1bXWc+jiDjD5B3SRcKtZdvt+/LGkGwFLZZgRHdcoZecmE7ou+jNM=@lists.infradead.org
X-Gm-Message-State: APuU4Z/cR2WgLEKahL0D5h/HOZ2XbTMZ1N3xOwFu3o5h0pmbzJl99nzr
	fyp2pBxW19GUS1X51vIs1ShRjNi7L4wHsUA1US9vnWmYHyilO4NEJd/I9k0isMVG7fJ9QLZo7Lu
	R4bCn4nc0/wz6Y8B/Hny+Qz/brwhNtd8=
X-Gm-Gg: AYBFou0f1cbb0DpruCcDFbKXhIzVds6Uqvkry7Bxv5Qe338Yb3mDitOki88ZyDKft9r
	9ByUZpC621u5lsWVSvbfXu0mqW7eIOpidiJIReUKwwUDOj80nOcefI0AfJOCnyvbSMis78im4I3
	uuGAPS7xICbOX5ONd/lHoe1UWGZkgJ0bfEjGN6qHmuC61O+YNEtR3vho12tfFRo+u39Re1dBbU1
	s0bK1fdg3aybqIi0eWw5hjmSRTuEPnkCvWQDny32AU/FMOu+PtFmVFKyHoxNj1SdC9XSTuiQ7/k
	DS8o7/+VXE4KtjtTDP8LE5xqdgosxFZ6rWZCAIxdn2LvmJiQL/g7+iRQzjZQcTOmD4D+q+Eojle
	V3tJLNR526GCGd/7g3H0UsJhUAjK2EF9RH/RgWahwkZDTD5UQRBqnvqumq03Lc9BPrtde9O0o1G
	Ew5yroHDJgc3X9uaY/
X-Received: by 2002:a05:6102:f13:b0:7c2:5692:1917 with SMTP id
 ada2fe7eead31-7d301b8446fmr459013137.10.1794293859655; Mon, 09 Nov 2026
 22:57:39 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Christopher Griffin <christophergriffin05@gmail.com>
Date: Tue, 10 Nov 2026 00:57:28 -0600
X-Gm-Features: AclHuK-ugbccll-p_Y-1vjiqdOoRo5wtQJSfTOSPG7IArA7RJi8LRKvYE_A9LRY
Message-ID: <CAKobHXAfLKmJWSP_xNKwmNVkd4M92XhVXkVMcG5nxCBnbphH5w@mail.gmail.com>
Subject: Re: [PATCH ath-next v5 0/9] wifi: ath11k: airtime queue limits,
 airtime fairness and a driver TXQ scheduler
To: julius@bairaktaris.de
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, jtornosm@redhat.com, 
	baochen.qiang@oss.qualcomm.com, rameshkumar.sundaram@oss.qualcomm.com, 
	toke@toke.dk, sven@narfation.org, john@phrozen.org, 
	tamizh.raja@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_225741_050737_2C1B8652 
X-CRM114-Status: GOOD (  12.69  )
X-Spam-Score: -1.9 (-)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

(In reply to the v5 cover letter,
https://lore.kernel.org/all/20261018174904.1757161-1-julius@bairaktaris.de/
which my mailbox doesn't hold, so this may not thread.)

Hi Julius,

I tested v5 on an Arista C-360 AP: IPQ8074 (AHB) for 2.4 and 5 GHz,
QCN9074 (PCI) for 6 GHz. The base was OpenWrt main with backports 7.2
and the TX flow control v7 patches 1-3 underneath. Flow control
patches 1 and 2 needed fuzz 1 against OpenWrt's IPQ9574 patch; the
rest applied as posted. I swapped the modules in RAM and ran A/B/A
against the unpatched driver.

2.4 GHz, ch 1 20 MHz, two stations downloading TCP for 60 s each:
an 11g-only station (a FastConnect 7800 with HT/VHT/HE off) and a
2x2 HE20 station (BE200). A wired host pinged the 11g station every
0.2 s:

run | 11g Mbit/s | HE20 Mbit/s | ping avg / p95 ms | ping loss
without (A1) | 1.6 | 64.6 | 5275 / 7710 | 4.7%
with v5 | 1.5 | 52.8 | 375 / 769 | 0%
without (A2) | 1.6 | 68.2 | 5415 / 9953 | 6.7%

On the slow station that's the same bufferbloat cure your cover
letter shows. The codel drops land where they should (385 on the 11g
station, 89 on the HE20 one). Its share of the air stayed at about
5%, which matches what you saw about the firmware serving queued
stations in turn.

6 GHz, ch 37 160 MHz, one 2x2 HE station (FastConnect 7800) alone,
TCP download, 4 streams, 60 s:

run | Mbit/s | TCP retx | loaded ping avg / p95 ms
without, run 1 | 1609 | 2928 | 31.7 / 57.6
without, run 2 | 1622 | 2333 | 17.2 / 27.7
with v5 | 1154 | 13100 | 6.5 / 13.3
with v5, fq memory 16 MB | 1340 (*) | 8077 | 10.4 / 24.3
with v5, fq memory 32 MB | 1398 | 2073 | 15.9 / 33.2
(*) steady part only, after a client-side reassociation

The default run's loss wasn't codel: the station showed no drops or
marks. It was fq_overmemory, 409 in the 60 s. mac80211 gives the TXQs
16 MB only when some band has VHT (ieee80211_txq_setup_flows()), and a
6 GHz-only radio has none, so the QCN9074 radio got 4 MB while the
IPQ8074 5 GHz radio got 16 MB. With AQL the backlog moves from the
firmware rings into mac80211, and at 1.4 to 1.6 Gbit/s 4 MB isn't
enough. At 32 MB there were no overmemory drops. What's left (-13%)
seems to be AQL's own cost at 2-stream HE-MCS 9 to 11. The 4 MB cap
looks worth fixing in mac80211 on its own, for any HE radio without
VHT.

I also tried the series with NL80211_EXT_FEATURE_AQL left unset on
the 6 GHz radio only (aql_enable 0 should behave the same). The radio
then ran 1810 to 1906 Mbit/s for seconds at a time, above the 1615
without the series, but it kept overrunning the TX buffer IDR: about
14000 "failed to transmit frame -28" in two runs of 60 s and 45 s,
each burst followed by a dip to 1000 to 1400 Mbit/s.
ath11k_mac_tx_push_txq() checks the TCL ring for room but not the
IDR, so without the airtime limit nothing bounds the frames in
flight. It may be worth ending the round on a full IDR too.

One note on 4/9: tx_duration there is the user's fes_duration_us, and
it's registered in full for each user of the PPDU. For a DL OFDMA or
MU-MIMO PPDU, that charges every station the whole exchange. My
duplicate of this patch (below) divided it by num_users. I didn't
test MU here (OFDMA and MU-MIMO were off).

That duplicate: I sent "wifi: ath11k: feed mac80211's airtime
fairness" on 11-08 without having found your series. It repeats your
1/9 and 4/9, and I've asked Jeff to drop it.

With the series as posted there were no warnings, crashes or
firmware asserts in any run.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.r4-00683 (AP vendor's build)

Tested-by: Christopher Griffin <christophergriffin05@gmail.com>

The tests and this report were done with Claude, an AI coding
assistant.

Christopher

