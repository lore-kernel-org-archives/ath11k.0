Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BABE606A31A
	for <ath11k@archiver.kernel.org>; Sun, 25 Oct 2026 04:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b18mncEE;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LUxvqDkf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OPCO9YjhwU3PhMX64BE3lbyAyE6lOGZesBGgUHvyjoA=; b=b18mncEEQ25Yu2
	tsiDwn3hzfZX9Bl/9AcKtNWLlN1ZKuKu0k6WV+KGh7L201jOc3jUfOif3r/hlqKC7kV65nD8Sk5lq
	7RQDTuZtnoCmsEnB3/IWglxKUviIFNlDn+8tnNWvGE6co0nHNb7FsFrHsdzd8qKy0o9mHiYfJ58N+
	a8Md8TpigX2Bvxkr/YRxCgEOYPmoV8shXiSQpXGivmjRJbskz138K0D8HA2P89SIIFibv7jUB8qNK
	Fi9E00tIRsNG9IWS80LqK8X6jDOz2Ki/hMo96D9ZQutdMxJTGjn/lua9yu954P56evhQIsrm3QYll
	DixxlFnGiXPHOicN0CQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKq3y-00000000ide-1Ux9;
	Sun, 25 Oct 2026 04:42:30 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKq3u-00000000icv-1sTx
	for ath11k@lists.infradead.org;
	Sun, 25 Oct 2026 04:42:28 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-18cdcfc05ffso2369861c88.1
        for <ath11k@lists.infradead.org>; Sat, 24 Oct 2026 21:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792903345; x=1793508145; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OPCO9YjhwU3PhMX64BE3lbyAyE6lOGZesBGgUHvyjoA=;
        b=LUxvqDkfPp0SJf4AV5+3WzbEQUVbsivPOuJI4RO0f0atPa3PoS6A4ZupwkSOUOIGFR
         azBir59loP3r/m5BsicdqzvlI+NZLBlgNCxqz0xeszp79dgvFah1O4S9zrH1FSS2EW0o
         di/cVngX8CzTQymOgbTcoRFawajOrM+xkvGNb6cXoYInVhgfp3SEG9Z7WwUvSi4eaROx
         HOklSGizw3s4uMW2hcPg6KAWRu+Qnkyj9POClFKI57UjysI5qE77ob/PdNVy+Bo4vtAj
         hJFi3NjBh7YdVcoXFVtpN05hiiS+dqRNGrW2r5xsQthnhKYCta2cg08VksxfIDb6HwXr
         nCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792903345; x=1793508145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OPCO9YjhwU3PhMX64BE3lbyAyE6lOGZesBGgUHvyjoA=;
        b=0oiBIbazNsp+7W8GQxjHEphSdaECYNOQ68nDXrRUWITEaeCMH9nb0oStL40+zhHOH3
         GPvfXlW1Be1D4tZHZD57FbcS3myeOSpR+7gTdn76KFj7pUnx+720ztSiQRRKWuEIG5+c
         aAAm+8A3a2ZbK2LErNsfLQpVh3rrK/LPF9vY18XhiYPXT7tQi2opwA9xkSAki+686Kyl
         pKcE3TpRAKx6/mBW8tnnNOpM8/iS6+cqWPYzj/bTBBlyz9RC4rE6yfQfzhmFMbIx6V4U
         CwxA2Pnv0skBckRw5pNvrPaYIYTpS5G6p0VqPdT0NgDA3ACTVQ8Z0C9PihHrhxkZNUPN
         g1JA==
X-Gm-Message-State: AFq9FYIuCFEerPxNotieNk++NVbu1rIBeGnoMwExgQJntMoHyVEIACux
	gC7Hj4pDcJCUke9QSxGdWHIrevYNj2B0fJDlSwUg62Sz0UoMem2C+e/T+nWqupQD2BA=
X-Gm-Gg: AYBFou3EoZZC1OMW4hhSKNT/4yInxTLncSgZHM+z3lrnFomXwCCzzB+wofFn1DvlU6j
	+AlUJBDrjU/EMwZ+s91/kZ/Kd//f4npMMNOo9HMzMNMj9+ar8dshRyBwfgCgunbyxbDF+Akpmm5
	iwgDNhZmYVYP0EFvC62IJZRkET1hB/PwcObaWbfLJYMI4vgBvix8fEFaWMVgPK0t0WBF4kE+owr
	xdUH8zsSJWqPVggIrM1n90rvphUyw2wWjzRdGp7meMFwPlNBmf1IRxAndfOFF0dKh3u5a4+u2Sw
	K1aDuzj6f51dDCNkp89IKluLwliP1p8yVxPcqCt/HcbgT4xiIq/sxflAjJ1JNIp5b+rrutNocq4
	kOfaClyuPo/0TEY0G8rIj9Bk05cpufdWTvfs8BaKqKiX1bxCViqzaItB0MXx3VEC45Sh8TmXl82
	C/kcyWL5eRzGK+o2zz2VMsHiIU6pCbV2gDEclAxBX5w/iZZBIZn/vCy7czZAC/Z4wAQMtX04/64
	Pn24segkO1L81q6uB6LyAfyD4cptjohDo2spfKdDNQXi2y9rodL1cnDLFIGsDXvl9L7dgeJDa99
	/gMDqJwUEKZYKstrj4Ecsw==
X-Received: by 2002:a05:7023:a86:b0:19a:8e3e:530e with SMTP id a92af1059eb24-19a8e3e563bmr5147203c88.8.1792903345218;
        Sat, 24 Oct 2026 21:42:25 -0700 (PDT)
Received: from ZephyrLabServer.internal ([165.162.64.148])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a37c88aasm11130088c88.23.2026.10.24.21.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 21:42:24 -0700 (PDT)
From: John Macias <dencity7@gmail.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	robimarko@gmail.com,
	openwrt-devel@lists.openwrt.org
Subject: Re: [RFC] IPQ8074 v1 / Netgear RAX120 v1: interest in support and review prerequisites
Date: Sat, 24 Oct 2026 21:41:57 -0700
Message-ID: <20261025044158.1375055-1-dencity7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CA+KzPsr0G_1tpEDyi2Dk_1ZF_JVeGJL5Y6_A0aCe=dY+5ufq+A@mail.gmail.com>
References: <CA+KzPsr0G_1tpEDyi2Dk_1ZF_JVeGJL5Y6_A0aCe=dY+5ufq+A@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_214226_495648_2178203D 
X-CRM114-Status: GOOD (  15.41  )
X-Spam-Score: 1.5 (+)
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

A progress update on the IPQ8074 v1 question, in case it helps. Robert,
thank you for the earlier guidance on openwrt-devel. Your summary of why
v1 was left unsupported (early silicon, different peripherals and
clocks, pre-final 802.11ax, no public firmware) gave me a clear list to
work through, and I have tried to check each point rather than assume
the answers.

Everything below is from a single RAX120 v1 (IPQ8074 rev 1.2, SoC ID
323) on OpenWrt main with Linux 6.18.55 and backports 7.2. The work was
done with AI assistance.

1. Pieces that are not v1-specific, sent separately

- READY event MAC-address array bounds, ath11k and ath12k, now v2 for
  ath-next:
  https://lore.kernel.org/all/20261021-rdy-mac-array-bounds-v2-0-cf7f45f868dd@gmail.com/
- The mac_phy_caps stride overflow was already fixed in ath-next
  (7a246c72132e, 4c6eb712a91f); I sent an OpenWrt backport to
  openwrt-devel today.
- The secure WCSS separate-M3 loading, as an RFC on top of v14 of the
  WCSS secure PIL series:
  https://lore.kernel.org/all/20261025042100.1356088-1-dencity7@gmail.com/

2. Firmware availability

The HK1.2 firmware is included in NETGEAR's own public RAX120 downloads
(http://downloads.netgear.com/files/GDC/RAX120/). Six public releases
contain a complete HK1.2 set, in two builds:

  V1.2.1.22, V1.2.2.24, V1.2.3.28, V1.2.8.40:
    WLAN.HK.2.0-01792-QCAHKSWPL_SILICONZ-1.379352.1.389278.1
  V1.2.9.52, V1.2.10.56:
    WLAN.HK.2.0-01792-QCAHKSWPL_SILICONZ-1.379352.1.536141.4

I have a small script that an owner can run to download one of these
official images, check it against a pinned SHA-256 and extract the q6/m3
firmware and board file, without running anything from the image and
without touching per-device calibration. Repeated runs give
byte-identical results. This follows the b43-fwcutter model: the owner
fetches from the vendor and nothing is redistributed. NETGEAR's terms
do not explicitly cover extraction, so I am not suggesting adding these
files to linux-firmware. Both firmware builds work on the unit.

3. 802.11ax

I have no way to show conformance with the final standard and do not
claim it. What I can report is interoperability: a 27-case client test
on both bands, with an Intel AX200 and, for the two-client cases, a
MediaTek MT7925. It covers WPA2-PSK, WPA3-SAE and mixed mode at 20, 40
and 80 MHz on 5 GHz and 20 MHz on 2.4 GHz, plus reassociation, AP
restart, radio restart, channel reload, two clients on one band, one
client per band, and a bounded load case. All 27 ran; 23 pass. The
other 4 asked for 40 MHz on 2.4 GHz and came up at 20 MHz, which
hostapd logs as 20/40 coexistence with overlapping BSSes, so that is
expected behaviour rather than a fault. MU-MIMO, OFDMA, TWT and 160 MHz
are untested. If the draft-era HE behaviour is a concern, I would be
glad to hear whether an HE-disabled v1 profile would be a reasonable
starting point.

4. Silicon, peripherals and clocks

The v1 Wi-Fi block does differ from hw2.0, and each out-of-tree driver
change is tied to a specific documented or measured difference: ring
register offsets, TCL descriptor layout and DSCP maps, 16-bit ring size
fields, REO fragment-destination bits, RX TID/NSS field positions, four
WBM release rings, copy-engine interrupt offsets and tables, a shorter
INIT resource encoding, a 9-word VDEV start response, a CALDB request
with coldboot calibration off, a reported high_5ghz_chan of 6100, and
zero NSS in RX metadata for HT EAPOL frames. Each sits in a separate v1
path so existing hardware is unaffected.

Outside the Wi-Fi block:

- cpufreq does not recognise SoC ID 323 and falls back to a 1.38 GHz
  cap. I have left that alone, since the v1 voltage/CPR behaviour is not
  verified.
- The APSS watchdog appears to count about 20 times slower than the
  32768 Hz that qcom-wdt assumes (a 20 s pretimeout fired after about
  409 s).
- On a small fraction of boots (5 of 300 in the last long run), transmit
  on one QCA8075 port stopped while everything else kept working, and
  only a full reset cleared it. A PSGMII init change that gates the
  channel clocks, runs the soft reset and calibration, then resets the
  QCA8075 SERDES (closer to the vendor SDK sequence) gave 0 events in
  the following 200 boots. That run also changed the Wi-Fi driver, so
  it does not prove the cause, and I have not posted it yet.

I have not compared the remaining SoC peripherals register by register.

5. Questions

I would value your view on two points, and I am happy to be told if v1
is simply not something the project wants to carry:

1. Would owner-side extraction from the vendor's public images be an
   acceptable firmware story for IPQ8074 v1, or is redistributable
   firmware a firm prerequisite?
2. Is v1 support something you would consider reviewing, perhaps
   starting with an HE-disabled profile?

I can share the extraction script, hashes, measurements and the v1
series in whatever form is most convenient. No firmware or calibration
files are attached.

Thank you for your time.

John

