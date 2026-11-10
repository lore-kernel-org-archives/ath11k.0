Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E530606A321
	for <ath11k@archiver.kernel.org>; Tue, 10 Nov 2026 06:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0G/4Rdx8;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dFeszzBd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ON76yPiGBPjOcdBUQsWjKqWuzblLf6KyNBqMD0/QiEs=; b=0G/4Rdx8DflAVNu7XIf3f1PRWG
	V0sPZ44mlrlnTnZSgPoroE4yJ40ht6W4X/8Lkm2L1UB7+9oKWHsbyR1L/LtBk1lUrKeeeUt2i2/ph
	9wmCP8aObtujWpfs5UPUYhHc2qU64RsYWEI7AXuoIJf0qW85MuIM+MPAud52aM7J6qkR1OJoJzmC/
	hYshcuu20Nu6JLRqmsh9zCefkC3g8BxmwXwT49/Q66u1IpjsNN62IpUBpWfGxZ4UHauHEfdtDkPDy
	KQWsGjxUswJvK646SSiq+iUmX94Oy8KKNh4HUkzNbgyAKfwwWTOMnmn5Hmu1WvYL/1McrfqavpvZU
	dvPbRkKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfkY-00000002ikZ-0UiM;
	Tue, 10 Nov 2026 06:54:34 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfkV-00000002iit-17vg
	for ath11k@lists.infradead.org;
	Tue, 10 Nov 2026 06:54:32 +0000
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-99c042cee7dso750905241.1
        for <ath11k@lists.infradead.org>; Mon, 09 Nov 2026 22:54:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794293670; cv=none;
        d=google.com; s=arc-20260327;
        b=EA1VZED6MbVwR3Qc0yBxYHdSp2M3a641ooRdwhPXhqQ+pQBQ2c0W0aX6Xyw1E2WbZz
         Wa8ZzJSGPuteCHl1oe2tEc4oclAftgopXnyo6CYUpKnBrqws4EXLjuWvTofL6jJypIYD
         vLobZ5O7uWx/Y4LFkXlVlBKLfohalfwT2HFZmTSq4tZ8gJHC/7g1IvFdToJG1xD4Wft9
         PpTS8uwtwxF5CtM5dqKtX/Mu0b2hUkM7tAxSnnlwC0EJpcKK5ePTMZud7M51wG40DKCq
         3kmi+XAAoBOPIRIddUFtOkA0vwGF0D2E6tu/cyNh/kXPK0a4tBzkHilfXJU1uREKs8cZ
         Mdlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ON76yPiGBPjOcdBUQsWjKqWuzblLf6KyNBqMD0/QiEs=;
        fh=LmkkKYSXQ1U6BV60GpTpiAAhFs1hErnQLZiwmEwRwCg=;
        b=lRnjTyV4oY1PfpcyvJKtCkw9zZFd7YmAFFkod1v0QPGwO2KSTUJ7sRBMJoFUVr5Rcs
         v74qJUdZKoxui1qUSwgu8mwxApnuEi8VU0fGtYEdyQO+37S+E2DKcCKgrrfOkSYvQ1Zs
         jq44IytLEqHAD+E2RBG+/NliKyRia7sttNzvvcPz0d1Wk7SRnVnlUDYeF8M8w+hKI4GJ
         s5z9ixc1B/rIiRpR4HC1txF5tzJPA+w5OeX2ybLhnqEn3psuUQj2uiPcODq0cWmuTI6T
         n8e9T8rxjfWDZLUEOCyM7PjIACAwyKvjUl0M91Gqx56DQmqT8wOOk9VP7bqd/IHGCRIO
         7jZw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794293670; x=1794898470; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ON76yPiGBPjOcdBUQsWjKqWuzblLf6KyNBqMD0/QiEs=;
        b=dFeszzBd/RRweaeD2a5KplgD2CT2LSuL9nemNUa+HnMqMfuXpU7Y2+Kahw5PY2CI1b
         /HuKmzpohtG96x+mMIHFX9kEJZ8MSspEOB0IBvoXJiZs7l/hVDJlnmSe5rvFBsLPh5HE
         0WHGJ7V4qvIzoQW8oDThemqLVq7M82lZaQvOJzHfFDArEeavZ4qyM+QVrOVam4YsGh1i
         c95H4945myEh0U+soA5/uGenTeX8Ts6W7vuvbxCSDpQI5fjy0JJFEKyY0ZzsSHIadud1
         qouz1br4O7iPdR8qChOMz/dT2EE57QR+N2NKh63B+FA8S0AGFil+9ufTWbTJ+h5JV6kI
         Mw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794293670; x=1794898470;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ON76yPiGBPjOcdBUQsWjKqWuzblLf6KyNBqMD0/QiEs=;
        b=yckNsh4utigVAAjN6YaI0oSegrLhMcNoHj1eWWU2koaNtf2jrkarXMcKaEauJ/wojS
         LkpVIo9NB/BrfPn2jtKkqj7a4TJffmq9TtViW8J/5u0npBN7l9kocdhqJ6mJQwvxbpbU
         81skAQ5Un7+FB9F2gEaQdq/377ZlfUcmaYBAat0LQgLFOgWCW0UTwmGfU6aJjFpcf6LV
         M/4GX4IRlpT4y4RS8rZ2sqSDCl/4cY+6CW135/7xN0U00WdDzXzjD4scQXplx1pINlGW
         mZckLbybVwltyG+00KXU7o/grm3Hz7QpoI+uGNkaO5G1pVht9t0LsAIzQVsNQVOketUq
         ooaA==
X-Forwarded-Encrypted: i=1; AL+hErEyhezplALA3oJzmnjWdmECLZJ/n8TpMAAi3LgBOpM/zOUEdhTnRseLlf6Ayc3MwonvGoNE7qc=@lists.infradead.org
X-Gm-Message-State: APuU4Z9EVzjgbb09eaZy4KTKKNcuDytc4FkmBZ/DHkkoEKc6i9VUL8YH
	IuwUvW7Q8DQEqVlo4dwpxaNq+eBmKNRLWVXaNJH3j0xjyiKY+gwJw8enffA7U9qs/P2VYMmKXrI
	VADnr+SNSaDT5mlQ3LDK3irzCjpHrztU=
X-Gm-Gg: AYBFou0wHvxwjtxklcCK17/qfj5dmB90hLrQDoXEAutuQmCpiGrLtuy3t4Jqf7VLxv4
	3QczlyreSOPk+CPIbNkdPmYuOdwiZJCipY+uAjk1PDIcK40LMXaSIf66J8XpQEyClpL5o/nSAHE
	9lwo24M+m30b00KhxCObicy7i1Ge6SjClUkQPlctF/bIhSKRh+m1hII/aa49DkL9JIiDRF7/U4l
	M9chIEozrT4nrL4CRR+cTBHM9fZA7j7Od0pHyo4v/saPNdVg1/WShtZsBYE5XrieC83JACYxq/M
	9hJsYZeKmJEEipJScOYyXpIdJ8ykv2EJMt8bWbPBXnSCLOWH6KaT/Rj8FJVjAqNuTdTiFVN8F+7
	0VNJPcBI20HaZawGvMiHU2HMSi7BbB5kXVp3sLUZbtvY40DMP6TXFQBXtEeejc5nja1DXVmeUaz
	VINrV3YgvxQJ6eu+3Y
X-Received: by 2002:a05:6102:579b:b0:7d2:cf82:1a5f with SMTP id
 ada2fe7eead31-7d301c194a3mr577202137.24.1794293669561; Mon, 09 Nov 2026
 22:54:29 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CAKobHXBuRr2Mz=yqFoqzQpeL9nY6ZeXY1HftEwyUxPYoDkS_+w@mail.gmail.com>
 <CAKobHXCMdy1YT8SO+kkZP9sCr+KOhOXU+if_r=_hb_5pgKO0mQ@mail.gmail.com>
In-Reply-To: <CAKobHXCMdy1YT8SO+kkZP9sCr+KOhOXU+if_r=_hb_5pgKO0mQ@mail.gmail.com>
From: Christopher Griffin <christophergriffin05@gmail.com>
Date: Tue, 10 Nov 2026 00:54:16 -0600
X-Gm-Features: AclHuK_Xu-_4ngLn3T1h_mV8L2B9Pvc_TLsSCnvFrlmuhuWEjpoBW9WF3FgbfRE
Message-ID: <CAKobHXBhqnB0c2gDEn+so-0AMFg5aj4pv=rEey9mCLHgHy-pBQ@mail.gmail.com>
Subject: Re: ath11k: QCN9074 public firmware stalls at QMI cap request on C-360
To: baochen.qiang@oss.qualcomm.com, rameshkumar.sundaram@oss.qualcomm.com
Cc: jjohnson@kernel.org, ath11k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, vasanthakumar.thiagarajan@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_225431_318489_0B1D3506 
X-CRM114-Status: GOOD (  11.60  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Baochen, Rameshkumar,

A direct question on this one, since a month of testing has ruled out
everything on the host side that I can reach.

The board is an Arista C-360: an IPQ8074 host with two PCIe cards,
both 17cb:1104 and both reporting board_id 0xff. One is a 4x4 QCN9074
(6 GHz); the other is 2x2, probably a QCN9072 (2.4/5/6 GHz scan
radio). ath11k from backports 7.2 on Linux 6.18.

No QCN9074 hw1.0 build that Qualcomm has posted boots on it. That is
24 builds now: the 15 in ath11k-firmware (2.5.0.1-01100 through
2.9.0.1-02146; 2.9.0.1-02175 has 02146's amss.bin), on both cards,
and this week the nine under testing/ in quic/upstream-wifi-fw, on
the 2x2 card (2.6.0.1.r6-00010, 2.6.0.1.r7-00002, 2.7.0.1.r1-00003,
2.7.0.1.r2-00005, 2.6.0.1-00828, 2.7.0.1-01701, 2.9.0.1-01385,
-01713, -01832). Two builds that are not in linux-firmware do boot:
the AP vendor's WLAN.HK.2.5.r4-00683, in 2 s, and the
2.15.0.1.r2-00004 from my earlier mail. amss.bin alone decides it:
the vendor's amss.bin boots with any public m3.bin, and a public
amss.bin fails with the vendor's m3.bin.

The failure is always the same, on either card, with the other card
bound or unbound:

MHI SBL -> mission mode, WLFW service connects, indication register,
host capability, memory request (type 1 36700160, type 4 3784704,
type 3 1048576, type 9 8388608, type 10 8192), the host answers in
2 MiB segments, FW_MEM_READY arrives, the host sends the target
capability request, and the firmware never answers it:
"failed to wait qmi cap request: -110". No SYS_ERR, no RDDM, MHI
stays in mission mode.

The same public 2.9.0.1-02146 boots on a QCN9072 on an IPQ6018 host
(an Arista W-318) with a QMI trace that is identical up to that
point, including the segmented memory answer; there the capability
reply comes at once.

So, the questions:

1. Between FW_MEM_READY and the capability reply, what does the
firmware do that can hang on these cards behind an IPQ8074 host? Is
there a known dependency that the 2.5.r4 and 2.15 builds handle and
the posted 0.1 builds do not?

2. What can I capture to show where it sits? I have forced RDDM dumps
of both cards from the stalled state and can send them; tell me if
another log or MHI channel would show more.

3. If the fix exists in a release branch, can a current QCN9074 hw1.0
build from it go into linux-firmware?

I can run any test build on this hardware the day I get it.

Christopher

The tests and this note were prepared with Claude, an AI coding
assistant.

