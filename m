Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016C3CA0EED
	for <ath11k@archiver.kernel.org>; Wed, 20 Aug 2025 23:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yx9tDzVnt2UCcod+hBGleC6/LhT/OguWs/OKq8aq0Wc=; b=qv5DjujIrfnJMmIZm6qSoonGzv
	xANA11MC6pHyKic2ZJXofdqetwt8kTI5tYtbjUiHB2JgYWfhTn+6k8UXT7hdGkkV15cVWXPI2jBF/
	KnUreJl85+A9sXqHi8gU2JGqweilr7H2r72V77tZpPvFkz5d6fqGowfNeIZ9yPZ+DLKqAMCPNKbK7
	lGgXYO/tVTvurQdrcgDhHZGOWpu39ARZbgDbu6K+esUGv++PjyQtmicer+BXIzwsbe5zsXZjdG3u4
	aVk8S8yEISyqpMhbpsbKkFNXW3ZukwQRk3mudzgHH1eS0KGaKSjrZPDqgv0afPLyiU0anSYHVn8co
	Q8kTwMFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uorpG-0000000F92i-27ul;
	Wed, 20 Aug 2025 23:02:38 +0000
Received: from resdmta-c2p-566137.sys.comcast.net ([2001:558:fd00:56::c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uonfz-0000000EhOa-3sue
	for ath11k@lists.infradead.org;
	Wed, 20 Aug 2025 18:36:49 +0000
Received: from resomta-c2p-555955.sys.comcast.net ([96.102.18.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 256/256 bits)
	(Client did not present a certificate)
	by resdmta-c2p-566137.sys.comcast.net with ESMTPS
	id onLvu5dUgfRqsonfqulgAI; Wed, 20 Aug 2025 18:36:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=20190202a; t=1755714998;
	bh=yx9tDzVnt2UCcod+hBGleC6/LhT/OguWs/OKq8aq0Wc=;
	h=Received:Received:Date:From:To:Message-ID:Subject:MIME-Version:
	 Content-Type:Xfinity-Spam-Result;
	b=keV6/zZgg8fNK/jXF+XmWY9k5e+SlHXVQTQl4iqoim/C8Q3nk/U3W+pBaMRART7PE
	 roi5gMpU8ywhkv3ip7V2xaeQ1Z+UTOB3KTPnQjCzVA0hlKWu9XvK3yRtJcM9JHBILw
	 AgRcmy/nPT0h5yul+5mfIn6KjhAT/7TQvTlY/IeV3DwRXw7kzy83igucLQsOSdfJKa
	 +PmDlopXZnOav7zbH5zf69eYRuLgOtCpb/cYAsaXiA1h7vJjY7iy0s9hRvjFvFGnR2
	 aYbbHRNX+HPava1jjgLIUaPT2fLnnSPgNKv4sPS/ZUCaIslKJxqgdSMT+Vt4u4+AZF
	 5D8hMz/YSqwEQ==
Received: from boobie.home ([73.69.89.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by resomta-c2p-555955.sys.comcast.net with ESMTPSA
	id onfnu9te9lltSonfnu6YiG; Wed, 20 Aug 2025 18:36:37 +0000
Date: Wed, 20 Aug 2025 14:36:35 -0400 (EDT)
From: Ameer Antar <ameerantar@comcast.net>
To: Balsam Chihi <balsam.chihi@moment.tech>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	jjohnson@kernel.org
Message-ID: <1664582047.0.1755714995989@boobie.home>
In-Reply-To: <CAONkfw452N+cOrLo4p7KXOE_W6p=CFHanBReDdnenXrgEY6Cww@mail.gmail.com>
References: <20250611164004.38580-1-balsam.chihi@moment.tech>
	<91fa8b1d-7bd0-4beb-80ef-eb65d2562f17@oss.qualcomm.com> <CAONkfw5Xyk8CGmVDpWZfkWnuCcFq6400jUkqyeMDtS0UNSh9vg@mail.gmail.com>
	<ecab2156-b234-4fba-a2ad-13a2d9b4693f@oss.qualcomm.com> <CAONkfw4hkDQtJyOj4RVsR3V=FJDJYKnjtmqzD=jBMy1ax=tC_A@mail.gmail.com>
	<0dfe48fc-085f-4dce-933d-e0f132d2ff9c@oss.qualcomm.com> <CAONkfw4p1AuE-MhGiZNMmi-PXR+CjoY63K2Yx_dmv2vnjo-Eyg@mail.gmail.com>
	<CAONkfw58jcGRxotm2zJasQd56oDR-h0b3Z0Yi+pE8hdrmN=Ucg@mail.gmail.com> <1321153053.0.1755624998195@boobie.home>
	<CAONkfw452N+cOrLo4p7KXOE_W6p=CFHanBReDdnenXrgEY6Cww@mail.gmail.com>
Subject: Re: [PATCH] ath11k: pci: avoid unsafe register access during
 shutdown
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CMAE-Envelope: MS4xfKe8auRrZYTHKBGgeCQqUdjSZxZZVltNgukOtPQwSJS35J/eX45Pu99AK0J46AHJ79ZC7FwZoCOnYxq/SJhQu5mNnkCXYjPuNpFEh53O26OQKsjW3o7L
 mQF2Ga4/Jsj0dof2fbkcxWR0xgfeqkKedKm0YldXPvQt1tisuEkYuR+tON4RZdGeQ44zuF1ERqQ5dUOvEei3PIDiIr530DDsBBdQMQsRCibX1vWW2BCEJNvI
 70E6vm6lsAa1zxLMOSXhwC71O12YgpQNx+bR2ipHMrFXJVmssDJMFE720n6C0d65P6fOqWDNJWrYyRz1QHXWlmGGLorUzHEY9OOZ7jpza02cFrtf7qys9Vzh
 1HJwrHIh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_113648_022799_5F8FA6D1 
X-CRM114-Status: GOOD (  13.56  )
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

----- Original Message -----
From: Balsam Chihi <balsam.chihi@moment.tech>
To: Ameer Antar <ameerantar@comcast.net>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
jjohnson@kernel.org
Subject: Re: [PATCH] ath11k: pci: avoid unsafe register access during shutd=
own
Date: 8/20/25 4:14:11 AM

>On Tue, Aug 19, 2025 at 7:36=E2=80=AFPM Ameer Antar <ameerantar@comcast.ne=
t>
>wrote:
>>
>> Balsam, do you have a patch for this? I also have cards that require
different
>> bin files for each band. I haven't been able to figure out how to do thi=
s via
>> configuration rather than rebuilding drivers.
>>
>
>Hello Ameer,
>
>Yes, indeed we have to rebuild ath11k but once with the patched
>core.c, not each time we add a card.
>Then you can add text files named with the pci device address and the
>path to your board-2.bin inside,
>for each instance of the driver.
>That way we avoid building the driver or the kernel each time we add a
>wifi card.
>I'm cleaning up the patch and I will send it to the mailing list if
>you are interested.
>
>Best regards,
>Balsam
>

Hi Balsam, yes that would be great to have as all of my cards use 0xFF for =
the
board id and I have been unable to use any multi-band setup using the same
driver. I'm sure there are others on the list with similar setups that woul=
d
appreciate that as well.

-Ameer

