Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76512606A334
	for <ath11k@archiver.kernel.org>; Tue, 17 Nov 2026 09:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P+7pQI1F;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kff3t7jb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aFbL7DPQrbwmV9RsnxDByez1wCBsyAJ2cbowb9paKWw=; b=P+7pQI1FYYgTKV
	9x5nJk5QJ/6679/uQYV8LFqKFwuVowic3irj6bCMeCN/ndpu/2uMJfqLEl/90G9bL4EwfaN+n1kFk
	AZGxpQghMTIskbRIz62uT+9H1I36P7mQ+KSx/UHPy034XvuORZlgkg5YbyiaD65l9Mh9fF2sURFgl
	3eLIz3MNET9cJXxXfkxuZcHlBjEhR+joVmh/dq0vA4s1LI5CAq79MP7hv1c18Qjq6hjm3lnILau1M
	fk8D0ZQJho2KhIwCmnmzZzMWBQ60xP4BziLsVUaiW65dhCF432YOgH7Nt9jE9HPj1cZWVqIkK4Tn6
	jY1pZTMWow94HVqy6cng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTF7X-000000050lf-2WNN;
	Tue, 17 Nov 2026 09:04:55 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTF7R-000000050gd-1kvJ
	for ath11k@lists.infradead.org;
	Tue, 17 Nov 2026 09:04:50 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-c4d30639709so605820466b.0
        for <ath11k@lists.infradead.org>; Tue, 17 Nov 2026 01:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794906287; x=1795511087; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aFbL7DPQrbwmV9RsnxDByez1wCBsyAJ2cbowb9paKWw=;
        b=kff3t7jbAxq+A9BPobi8wx1ITV6jUivKxy8O1iI9KBOX+Gz9Rk2aBFvzKQu8Jx+6UJ
         O8uOcyJlkeU119j6c9PI6tbu/+1wQSBa6DMBl6TO1wikWk2i2VOxpmgx4rwAQXksaIm0
         TxELL5s18kMwq1lc74Syyl6ETcfBlu/VXeJxrflksKZrH6VFgQYuC1voHyjcBuFcReNR
         TjiEpgdodMRitLsGXowuS6pBStKNLPBmDHl/3mZX0fnZjrnSj+rBX/+eVruWOWGSX4IT
         EYzAT97xOG+U1WjiKBiZfWDM7Oj5UGEg0UXKzqVa7I/ofcJsxiclLe9BGa5hY6qt8JQv
         yKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794906288; x=1795511088;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aFbL7DPQrbwmV9RsnxDByez1wCBsyAJ2cbowb9paKWw=;
        b=aZHycMzzGcTD78305XIXpsy+3hqTf8W6kbKDsykMfsudq6RkKb1Y7e33/VNFu/VWTA
         9XECE31tJq/uZ6fJKhfMyy31qyXReIiZSFF8vA52IlmjwjlRuCUll+0ee0Xh2MnZjhIY
         2rWhy5dHPvsaTMxH5UhVwC/9yOpIljV5M6lRylKbKrxqwpVSY5gyVirxtVOklvhFVfI8
         WHZ4xv9GvDwFe/efDaYD50B+w9NrOTSp6HyO1kfyRXPnhIpQquM+VTtlYl6Kji/kohuV
         5ADNlRzqIyfuumwcu3lzzSOPU+VP8EBCxAtEu22JPuxL9At2PNUnr/u0xaVX/lw0QgRk
         uTBA==
X-Forwarded-Encrypted: i=1; AL+hErGffSrFQzBCOLApNR4gl0X8tivGSmhgp339Xjsqu2AbY1ilJUVV3JSAiso/pUVKOMmxG1XbbNM=@lists.infradead.org
X-Gm-Message-State: APuU4Z9+8Bs5DvyTf8dMozwsfpkjMNIkKa4Bu75OrPaxFqo4sEmNN26x
	wXa8HEDIkCe5lHr2njN7SrxS/8Kb7S1b7jiBVCGjMQsiAVM7qTCqkfdT
X-Gm-Gg: AYBFou3JCVghNj03doCbaAwE/FKmmUKP9EwUvcTB6015JP90xeyC77XYu0rSTyoWesj
	3oLuOtRE7nqcRgUFf3Y8OaUuFt97PRxMMAVobBSVR+eepsRs/ed+EXqBlNkXICpZOofg7+KsWTt
	wHxdAp7SMH9NHHbILI+EUVVUge9jKN2Gw9tYUteAahtAohy7OVa0pL4PfPOM8GOp8bfZ4WzOJ45
	sciFh1/EXcioCiA+CAq1u2HceZHVqsHuqCIX7H/yurorSvR6rJduln7tg9k5NuvxSPAP/L4XjX5
	mVCU8GMK+UETEukjXN3QfBk4bndVRWlexJnwWWoA7HjRH84vOuaqHIEZ3ewKnj9UWWwK7VTLpGs
	KbGYQdgAVV/nFL/TGCVrw7fQNKNlKPMlDqIhQCRgHK+rBNp94vZp9T/QmVZUsLMMG0BKOMysAHh
	0VJbMn8ugImcRxwbP1wqGSpI9ZQv5m0QDReWxzKJ+7ROZW4e0BBOrzGWkLBf0UhuujHnT+M69BX
	g4vRIk0N8UekBt0LnKxkCBvl2mIpE7aUIBS97cz2x8LyAjkV/SJmTxrsoRd7tCXI7spqGqfq3bs
	3owkqj6Y9StDwIgBe/7fNdDNJWQ9XsxN3/F481MWDHA4a+sdXfvCuMxV/Ktj3eOi86IINWjFjs4
	Mki06qdDrvpKkKUzTXc9+yfqQhs345kt8RdGseHtUAad3Td4=
X-Received: by 2002:a17:907:a08e:b0:c50:a7ff:f880 with SMTP id a640c23a62f3a-c50a8000de5mr841456366b.34.1794906287414;
        Tue, 17 Nov 2026 01:04:47 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5fe370f8sm24106161f8f.27.2026.11.17.01.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 01:04:47 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 10:04:46 +0100
Message-Id: <DMXD6CV42W7U.2MVL2J7R8J7W1@gmail.com>
Cc: <jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH ath-next] wifi: ath11k: don't create a duplicate peer on
 the same pdev
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Nicolas Escande" <nico.escande@gmail.com>, "Fernando Tapia"
 <fernan.tapia@fernandotapia.eu>, <ath11k@lists.infradead.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261113120325.2913-1-fernan.tapia@fernandotapia.eu>
 <DMXCW8192G9S.19BCMYODX8KSK@gmail.com>
In-Reply-To: <DMXCW8192G9S.19BCMYODX8KSK@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_010449_468049_2138D43F 
X-CRM114-Status: UNSURE (   9.28  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue Nov 17, 2026 at 9:51 AM CET, Nicolas Escande wrote:
>
> Guys, I'm all for fixing bugs, but at some point you need to start readin=
g
> and searching the mailing list before pointing your LLM to any crashing
> target. This is the third time someone posted a fix for this issue:
>
> https://lore.kernel.org/linux-wireless/1316ed692b84f1d956e4854d9e974569a3=
961795.1784792420.git.repk@triplefau.lt/
> https://lore.kernel.org/linux-wireless/20261001164139.370144-1-patricktla=
wler@gmail.com/

Even worse, 4 patches in total:
https://lore.kernel.org/linux-wireless/1316ed692b84f1d956e4854d9e974569a396=
1795.1784792420.git.repk@triplefau.lt/
https://lore.kernel.org/linux-wireless/20261001164139.370144-1-patricktlawl=
er@gmail.com/
https://lore.kernel.org/linux-wireless/20261026040302.2635133-1-dencity7@gm=
ail.com/
https://lore.kernel.org/linux-wireless/20261113120325.2913-1-fernan.tapia@f=
ernandotapia.eu/

