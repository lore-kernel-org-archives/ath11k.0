Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F63606A323
	for <ath11k@archiver.kernel.org>; Fri, 13 Nov 2026 06:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OmVW7+4O;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=domov.de header.i=@domov.de header.a=rsa-sha256 header.s=s697561 header.b=MTgf92aA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mZONIYnW8+Xtz/W7yL4lA48kSuBOoYRJ/ql3Y9SPYbc=; b=OmVW7+4OIhVxQG
	sZcpgnhTIEygQAfsFEcEVwKxstL8QtGrwVvyMR8CW42Bj5RcZ0A0+KGXeJcKUie65LrrCsx6QaJpI
	iaIPsweSkSshwLw2uAwVav7zhtkk9UaP+3ipJaCxPfj8HCSrkGDJu71hGiiTRJkgkv3hIXlvjdcfy
	0fWM7zjoHInIaM2wCIJVRUK9dn1ac4VjFXqVGJyI1S9BNno2GcFxcDUt7kEYe9Hf0se6PaArIeKDz
	h67Z+zDnyGVDrvlDwilEDjJR/10wEmgLVb2BVvcfewTdHQxfr0YB47gDFus12Lv3Jg3zPULgPIeN4
	v5TmK238fEQ5GyK+39aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRkeg-0000000BlSt-3xMq;
	Fri, 13 Nov 2026 06:20:58 +0000
Received: from e3i824.smtp2go.com ([158.120.87.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRkee-0000000BlR9-3GAv
	for ath11k@lists.infradead.org;
	Fri, 13 Nov 2026 06:20:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=domov.de;
 i=@domov.de; q=dns/txt; s=s697561; t=1794550842; h=from : subject : to
 : message-id : date : list-unsubscribe : list-unsubscribe-post;
 bh=mZONIYnW8+Xtz/W7yL4lA48kSuBOoYRJ/ql3Y9SPYbc=;
 b=MTgf92aAE30uC4my6tyTIPvA6CE61r09M+SevdUFvtfHsZ+sBQqyPCsTwx3+TOmWnH5Gy
 WQe9BHIPBF/1G81nJHHKpw+eoP1JoRGJAShCJn7bXjl4FL4/yJaTzdVsm//ysnK+J8Gpp9c
 lcU7glK/xFk0Iu8StBadbSeZsVRCQEXgzgRiO/SLLWVEpRxKxI4oA4W69riFJpvp3/Wib4y
 AdgoZtAHQp9a5cnb7NbDbWov2oUOxtFzY0h0Rdqyj2bJlUeHcKHbW+PYIfhc/6ETz1bcmIa
 MjzDCCPk5N/gsT7nPI5ySfi2yloofXTAKcOO9bqo4Ubpgi5aVzVDX3VTMV6g==
Received: from [10.240.241.197] (helo=mail.domov.de)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256:X25519)
	(Exim 4.100.1)
	(envelope-from <ath11k@domov.de>)
	id 1xRkeN-4o5NDgrnoqH-o3yR;
	Fri, 13 Nov 2026 06:20:39 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1F7BE44001;
	Fri, 13 Nov 2026 07:20:36 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: ath11k: 802.11s peer stuck at 1 MPDU per PPDU until DELBA 
 (IPQ8074, WLAN.HK.2.9.0.1-02146)
From: Andreas Ufert <ath11k@domov.de>
In-Reply-To: <47133D6D-8DEF-42DB-A432-095B8DDF0974@domov.de>
Date: Fri, 13 Nov 2026 07:20:25 +0100
Cc: linux-wireless@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <C98FFCD8-EEAE-4355-BF18-0FE86D3D623A@domov.de>
References: <47133D6D-8DEF-42DB-A432-095B8DDF0974@domov.de>
To: ath11k@lists.infradead.org
X-Mailer: Apple Mail (2.3864.700.51.1.1)
X-Last-TLS-Session-Version: TLSv1.2
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 697561m:697561a_MogmP:697561sOu6w9NKWM
X-smtpcorp-track: zhQr55HR3nSd.VgcWHdvL4RqT.6eCBIgSfAvh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_222057_293978_CDCDFC21 
X-CRM114-Status: GOOD (  13.83  )
X-Spam-Score: -2.0 (--)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

a short follow-up with one more occurrence, this time on TID 7, and
the first one caught by the tid_flags check from my first mail.

After that mail I added a per-minute check that reads tid_flags
(HTT_TX_TID_STATS_V1_TLV) for every peer and TID 0-7 and alerts
when bits 0x4 and 0x8 go from set to clear for three minutes.

13 Nov, 00:30 CET: the check fired for TID 7 on A -> R and B -> R,
in the same minute. TIDs 0 and 1 stayed set on all links, and an
hourly iperf3 probe (TID 0) was healthy all night, so without the
check this would have gone unnoticed. At the onset there was no
"tx failed" burst, nothing in the logs or dmesg, no re-peering, no
reboot. Mesh traffic per node around 00:30: A sent 15-54 Mbit/s
(destination and TID not recorded), B less than 1.2 Mbit/s, R 2-8.
So, as on 10 Nov, a sender that was almost idle went into the state
in the same minute as the other one.

Measured at 06:41, 8 s of iperf3 each, htt_stats type 1 on the
sender, TID 7 via --tos 0xE0:

  sender->peer  TID  Mbit/s   MPDUs  PPDUs  MPDU/PPDU  MSDU/MPDU
  A->R          7      29.7   21728  21828       0.99       1.03
  A->R          0       550  131434   8022      16.4        2.91
  B->R          7      23.2   14646  15063       0.97       1.12
  B->R          0       407  142674   5705      25.0        1.97

tx_xretry over the same runs: A->R TID 7 2311, TID 0 495; B->R
TID 7 5199, TID 0 1053. On R (type 2, during the TID 7 runs): from A
22011 PPDUs, 22300 MPDUs FCS ok, 83 FCS errors; from B 17921, 18015,
243. Again a clean air link without aggregation.

tid_flags for TID 7 to R read 0x1014000 on both senders, all other
TIDs in use 0x101400c. On B it read 0x1014800 once at idle before
the load runs; I have not seen bit 0x800 before. The load did not
change the flags. agg_status on R showed TID 7 as "RX 1, DTKN 0x01,
SSN 0x000" for both peers, the same as on healthy TIDs.

Cure at 06:42:51, on R, both peers at once (no control this time):

  echo "rx stop 7" > .../stations/<A>/agg_status
  echo "rx stop 7" > .../stations/<B>/agg_status

Afterwards TID 7: A -> R 683 Mbit/s, B -> R 372 Mbit/s, tid_flags
0x101400c on both. Right after the DELBA and before the next TID 7
traffic the check still saw the bits clear on B for one more
minute, which fits the reading "aggregation set up" rather than
"healthy".

So far:
- the state has hit TIDs 0, 1 and 7, always per peer and TID;
- twice now (10 Nov and 13 Nov) two senders towards R went into it
  in the same minute, one of them almost idle;
- each time a DELBA for that TID from the receiver cleared it (three
  occurrences, eight peer/TID pairs);
- it lasted about six hours this time, until I intervened.

Full dumps from before and after the cure are available on request.

Thanks,
Andreas Ufert

