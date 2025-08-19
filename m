Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2703ACA0EE6
	for <ath11k@archiver.kernel.org>; Tue, 19 Aug 2025 19:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KkdjP+xkKFxvCc4AqsmRbpDrphwVii66/2aadOjXg0Y=; b=VGqpk+kOE0R7RGaE3AFto6mMlw
	AS+sIVbrmq+w3lvbKQALoaYJXJnloYJDXoKvB3J99V3YyfyoCHUw3tiunIlUWn8xZh0z4DD1ZI8KO
	hkZu1HX006E8+zL5EhukehmMRrnYL12MxcID+VKJmslSwhDhA7zvJsJZBhN8Qo+3rvQMzed1xwO72
	E7ve+OI98DJ4TZEWL1XCbMz/s7iDHljSGcOwrm9j37BDUQ/76OKE6sGlM1yvXY5qp356J6MiWfdN0
	Fc2fEYP0om0cBO034BJwi9sUUGtIQoqTB4FaJQTu67FI6I4Wfjwn0+0IkVKWn1Te2FiCnXcP38bjN
	DWHEisPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoSS1-0000000BTwR-2CJ4;
	Tue, 19 Aug 2025 19:56:57 +0000
Received: from resqmta-h2p-567354.sys.comcast.net ([2001:558:fd02:2446::5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQGQ-0000000B7Qx-2bd3
	for ath11k@lists.infradead.org;
	Tue, 19 Aug 2025 17:36:55 +0000
Received: from resomta-h2p-555359.sys.comcast.net ([96.102.179.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 256/256 bits)
	(Client did not present a certificate)
	by resqmta-h2p-567354.sys.comcast.net with ESMTPS
	id oODkufmwIifAHoQGGuvfOU; Tue, 19 Aug 2025 17:36:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=20190202a; t=1755625002;
	bh=KkdjP+xkKFxvCc4AqsmRbpDrphwVii66/2aadOjXg0Y=;
	h=Received:Received:Date:From:To:Message-ID:Subject:MIME-Version:
	 Content-Type:Xfinity-Spam-Result;
	b=L5ixqhAkf6z6jMGCIOT14Ssciz4xtLuEEGgpp+OzAC4rF8fiOrP1g1d5KhgS6pUrE
	 8daqUTXfDa5XPx8PMJbBzOVoBH3s5N76yRmVdYyLurZf1qjDU+G/3sRd1o99YpGgqi
	 0dHjDcZml47VP2bqmsmX+0t19Y6n34/Gy2SO090xgp9GmQof87trVxMOR8+rvqZFIK
	 pqzmD9/gGmsLz7ARnYV7SXCR2pR8zQ7Hvq2sqvT0AyGkAJr/CsCJOEJoAopyGlkZy4
	 XLCwheumiOw6LWGGNdZaIkyEr2WHv8eLNCetDakq1T+a68gbCUxvQHrE1gcNol+9tf
	 6Sl/c4hatEO6Q==
Received: from boobie.home ([73.69.89.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by resomta-h2p-555359.sys.comcast.net with ESMTPSA
	id oQGCuwULGARtkoQGEuxiPw; Tue, 19 Aug 2025 17:36:40 +0000
Date: Tue, 19 Aug 2025 13:36:38 -0400 (EDT)
From: Ameer Antar <ameerantar@comcast.net>
To: Balsam Chihi <balsam.chihi@moment.tech>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	jjohnson@kernel.org
Message-ID: <1321153053.0.1755624998195@boobie.home>
In-Reply-To: <CAONkfw58jcGRxotm2zJasQd56oDR-h0b3Z0Yi+pE8hdrmN=Ucg@mail.gmail.com>
References: <20250611164004.38580-1-balsam.chihi@moment.tech>
	<91fa8b1d-7bd0-4beb-80ef-eb65d2562f17@oss.qualcomm.com> <CAONkfw5Xyk8CGmVDpWZfkWnuCcFq6400jUkqyeMDtS0UNSh9vg@mail.gmail.com>
	<ecab2156-b234-4fba-a2ad-13a2d9b4693f@oss.qualcomm.com> <CAONkfw4hkDQtJyOj4RVsR3V=FJDJYKnjtmqzD=jBMy1ax=tC_A@mail.gmail.com>
	<0dfe48fc-085f-4dce-933d-e0f132d2ff9c@oss.qualcomm.com> <CAONkfw4p1AuE-MhGiZNMmi-PXR+CjoY63K2Yx_dmv2vnjo-Eyg@mail.gmail.com>
	<CAONkfw58jcGRxotm2zJasQd56oDR-h0b3Z0Yi+pE8hdrmN=Ucg@mail.gmail.com>
Subject: Re: [PATCH] ath11k: pci: avoid unsafe register access during
 shutdown
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CMAE-Envelope: MS4xfNRExL+WcnRtJHrQ+U/4CjUMmGo271K+AGvdIzEKIYIvoIe5010ScJCPoxAyx48TkXsb+RrGktvJ934s07EF2MPTEkl8Rm+uzcBcxnfcDQsePeZ/ymDd
 X7LA8pS+IAiCpNOs4aDW8o4quHpG+RcQEmgDY/27D/URLkW0ql7tOF3b5pSilynEVmEPnB9sqzyZqeT2mxuD3s1e8d9LusXW4q3Ece+BmpjJQ+AZt9vuJnyf
 Jq1ys2pyxfQlelPhFl9WOrKkEGmJ5G5qD5wA340oAGnyZ3mivTEEolF8Ueemi3HKUmqbGPtkh0KA3fBjjpADEyENbPGpt/7stfJuDD5wi0lYs7RjOYTQet4m
 jHh2vDyA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_103650_681781_44F576DE 
X-CRM114-Status: GOOD (  12.82  )
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

Balsam, do you have a patch for this? I also have cards that require differ=
ent
bin files for each band. I haven't been able to figure out how to do this v=
ia
configuration rather than rebuilding drivers.

Thanks.
-Ameer

----- Original Message -----
From: Balsam Chihi <balsam.chihi@moment.tech>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
jjohnson@kernel.org
Subject: Re: [PATCH] ath11k: pci: avoid unsafe register access during shutd=
own
Date: 8/19/25 4:50:47 AM

>Hello,
>I Have a question on the same subject but not related to the bug.
>I have many identical PCIe WiFi cards on the system and I need to load
>a different board-2.bin on each one (1 adapter per frequency band).
>Is there any kernel built-in solution for that?
>I could not find any, so I had to create a patch that loads a
>different board-2.bin for each card based on the pci device address.
>I patched ath11k's core.c file so that it reads a string from a text
>file in the rootfs (board-2.bin path per wifi card).
>If the text file is not found, the driver loads the default file
>provided by linux-firmware for all cards, the original behaviour.
>Please let me know if there is a better solution for that.
>Best regards.
>Balsam

