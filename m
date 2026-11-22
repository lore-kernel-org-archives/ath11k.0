Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9BA606A32A
	for <ath11k@archiver.kernel.org>; Sun, 22 Nov 2026 18:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xgp03e4K;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=i0MMqnh3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PN4uLEIB+MU5TyNO9Hg+Xb+yNHfZcbzMhV7hOvpO8+U=; b=xgp03e4KW85HxX
	B1vu0PZFeUZXj4COawWeirM96By98gNn31LI7iSUZypr4uI6TdJ8J5Ajj99zCoWdZvZfwqa7XppLJ
	TfApu7Th9YIr9ZqtYu4nwPmXMXwwoV1b5LM8YWlUJoenKvPw6XkMt+pjC2Q+6GDNFGahsLAssr55J
	DAL+xEbnjTRZZgAugHvcJfoZm/erKMYH01aypy9tkMLBOkQUPXNyx0e8gRuMvjrL07U98/CAuFF6D
	E3u5xCLYxP7nFe8YMBOPMBynYDU4RL9ir2SDG5YWh+Oc8X6rItI1tuXylL2WlfHO2qODE9aV+8uZH
	M/HJTnsqgaZaGoiQLUIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC4L-00000001Vlb-0ATp;
	Sun, 22 Nov 2026 18:13:41 +0000
Received: from mail-ej1-f47.google.com ([209.85.218.47])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC4B-00000001Vjy-0JEW
	for ath11k@lists.infradead.org;
	Sun, 22 Nov 2026 18:13:40 +0000
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c50e26763a4so469703366b.1
        for <ath11k@lists.infradead.org>; Sun, 22 Nov 2026 10:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371209; x=1795976009; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PN4uLEIB+MU5TyNO9Hg+Xb+yNHfZcbzMhV7hOvpO8+U=;
        b=i0MMqnh3PWorUz4COtpMJGJonQaAiYGMj+ZDcf9Kdzq2R7xbHkSYkhXyjBuVVcUwp+
         hrq7hnlVuWcOjn+3H+n7QWllGlo2ZBMM+0PIfdgknzuAoveFroYQlLZogILu4p0Fe3RU
         +Ybi+zYCji7O98iyuqra93Xgq5jvkXompYM3L01kJVQBhJbsXDeOkY/mhWY3rqnYy7aj
         jpxZa+FWrX1kVlDmtr9XieCrIHutdpzUqC0X3jzdmjXraOAxyLEb5drTZYjB7Q9d5o+U
         npEGdjjDKG2cz4l0upOeKKxRAyfEomHtv136GtvJbjcw3LHD4T+pyiRmYQhRKyyWWJZ/
         +ToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371209; x=1795976009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PN4uLEIB+MU5TyNO9Hg+Xb+yNHfZcbzMhV7hOvpO8+U=;
        b=c+rVsabeT0M1/NPj+M/QdcZdMnMSslaGIJYyB95yz+ZATKuqX7KiE7CD8OqzhbFx7c
         WkglESAriSXmL3q2SGDwjbdgzWh2M2wFS87H+t1VW6B9fx6uZSwYydzTs+A79Wj1c7gG
         oy9EmPMkWkdtfVIpvsa+mS6enMb9Mnsd1yUzeyWFBleQlKLUsqTx5sjwfsovVOQmCp3r
         vdmlADBH/Fg1uKU/PBWmYUbpC96ZO27rV0e7rl3clEjcQIOcCYOx0kdK70wUhl3dXEXt
         a3hVXFGFzXReyXltJ6onAczaEDIRd+D8KoOxjsZMAPOVZGn7gplWrtHAi6SknPGCeB9j
         zZqg==
X-Forwarded-Encrypted: i=1; AL+hErFOk/NMFk1FlW6jk/RPBW7CzqpO7RtX8gAjfqOSb1/vjK7cnyKqDsvCoVZ/V5WHYx+HmqIxZdg=@lists.infradead.org
X-Gm-Message-State: APuU4Z86BdqaVrXQvKLUBQUT762hZ5j5LPjnglJVK8HQYMwKRRIejgpr
	m4UaV6wYTKD+JpNMVdezf856WAsohjKxSAfhBVq/QAkOZ2dvogUUJfN85/GfYDHvKw==
X-Gm-Gg: AZFdTZeCzrB1en9uuKV/niS9Oa7ldOWlAzd1Zijbc4ujG/dhoa8IkQcpWacXw4U2WG1
	er/g0sQ7IG0idBy4QWaCVMvLyuJWUuhU9SgQze2YaQF1AFH2ltUGja72Eu/KRq3thC2SpYmYlHV
	AW4Q5johQhHf3rodw3IEi71XJqX48ZUaG1txkFoegXwW2C1y8a9UX0iAvLG/dKuAtEqEMSpbi7E
	kDgObn432eLhO6xLTZ+AwYqle4E42jc9va7+y+tkuhK8eia2tSsKdcGcltGI4k5k2ktpLPc5YSP
	+GeFMi6c4kAjKR2z+md0dlcxejYxopSM6dyBdQZLmKYwZdSMGShT3UK+mwV+AG4Eh/ZSRsyPM2g
	LgfPnnqlDSbT192ZJuWvPA3sPkoKaRyVJ7osWSqCHMOa96ZuKBvpRoEd7/XalScVRpmiymMv2RO
	ubn02/uMasdu52rj4VgLquy/y2t4SIztABdmd5mwFQdtB68gPcwZduhmFCWfIGRJh4aE9voKrTv
	maUf/OV10VOnYQAaWAXefNobSfBbcrGny+/auaSzigZWqDWD4j8Wm3rEnK52idyyP2H65Y0a9ih
	0IoOSn3mDszgaTXaCRdcPX6U9qWTvO2jBeLEFayciiEE2/VN5P+R5MpZt5yDobFLqEdH5YIJhif
	g0CqRhReERkjVB3tLTLyDOnwz0iJBAp91jYkzaPfh2PrjbmvqAk+DwY4gEmCIxbVz02rRXgZZLi
	lTaCgbrH3NLO2NSTFAJlHWKa3yu5YWC86XkmO3FX5cnY+v20eMwrlhZo2YvTSTtzhNyclg/FqFP
	YCgUpiL2u5JJ/QcqnR+DJsZpAS6rumjvQnhWVIoNhXGynHtjdzsbVtiXHgBIzNVIGYZ/5IsmPHQ
	D7ZPTfRnYvhsr2rZdyhxYMJWI/TM7SPtpPXmyEzq/rhsa3YGRM8aSKNaHmEbNiNgXNdoyft5
X-Received: by 2002:a17:907:ea3:b0:c3f:e414:d35a with SMTP id a640c23a62f3a-c513ab013b6mr698428166b.26.1795371208914;
        Sun, 22 Nov 2026 10:13:28 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b02de1dsm328879666b.85.2026.11.22.10.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:13:28 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: christophergriffin05@gmail.com
Cc: jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org
Subject: Re: [PATCH ath-next v5 0/9] wifi: ath11k: airtime queue limits, airtime fairness and a driver TXQ scheduler
Date: Sun, 22 Nov 2026 19:13:30 +0100
Message-ID: <20261122181330.1018334-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAKobHXAfLKmJWSP_xNKwmNVkd4M92XhVXkVMcG5nxCBnbphH5w@mail.gmail.com>
References: <20261018174904.1757161-1-julius@bairaktaris.de> <CAKobHXAfLKmJWSP_xNKwmNVkd4M92XhVXkVMcG5nxCBnbphH5w@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_101332_607923_BB464574 
X-CRM114-Status: UNSURE (   7.35  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/10/2026, Christopher Griffin wrote:
> ath11k_mac_tx_push_txq() checks the TCL ring for room but not the IDR, so
> without the airtime limit nothing bounds the frames in flight. It may be
> worth ending the round on a full IDR too.

Thank you for testing v5 and for the two code points. Both are in v6:
https://lore.kernel.org/all/20261122181145.1015729-1-julius@bairaktaris.de/

8/9 now also ends a scheduling round when the ring's MSDU idr is full,
so with AQL off no frame is dequeued only to be refused with -ENOSPC.

> For a DL OFDMA or MU-MIMO PPDU, that charges every station the whole
> exchange. My duplicate of this patch divided it by num_users.

4/9 now charges each user of a DL OFDMA or MU-MIMO PPDU the PPDU
duration divided by num_users.

> Tested-by: Christopher Griffin <christophergriffin05@gmail.com>

Since 1, 2, 4, 7 and 8 changed, I did not carry your Tested-by over to
v6. Could you run your setup on v6?

> The 4 MB cap looks worth fixing in mac80211 on its own, for any HE radio
> without VHT.

The 4 MB TXQ memory limit on your 6 GHz radio is a mac80211 limit
independent of this series; I sent a fix that counts HE like VHT there:
https://lore.kernel.org/all/20261122150459.3108416-1-julius@bairaktaris.de/

Julius

