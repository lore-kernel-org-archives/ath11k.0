Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC7F606A323
	for <ath11k@archiver.kernel.org>; Fri, 13 Nov 2026 10:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1PCJlZg9;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rDpgFnpd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=MAPoy+obUd69nqkSG4F2hKPgASuGSPy3QCknDbxk64I=; b=1PCJlZg9CHZhur8qqfWr610+vX
	hIg1TqJ5AGAyHVFLwFZFFtlRQDLpDFm5F8jpOVIZyXT4AwJZCR8Lft76PByC+VMig4iwo+O+TlMkW
	hmejGyZB68jhcQU0JSCpSc1thBTq/+T9H2Nv69Sfvwh6s4MZFy6eZv0idJG2FWSmMFMKz6CYgYRSz
	raqOXXFubYmpliT5iXgU939qXkO+M1lkpxLHdCPk5WKGgLpmp7Kk2/+cKBqDCHgubBiAO2eMo1kF6
	fJ5tAKpDST4i8B0Toxxzeds+7EBd5p8gk9qgRCr6iC4NLqQ+9xwtlW8aayMWxWkM6TRZ4b32LQIGx
	bquHW/jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoPM-0000000CLMy-0vO1;
	Fri, 13 Nov 2026 10:21:24 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoPJ-0000000CLLq-05F7
	for ath11k@lists.infradead.org;
	Fri, 13 Nov 2026 10:21:22 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-3ac97e45a79so8771761fa.3
        for <ath11k@lists.infradead.org>; Fri, 13 Nov 2026 02:21:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794565278; cv=none;
        d=google.com; s=arc-20260327;
        b=Zd6/2OhYEqukIFtlmfsKc6UTTlqN+e0Gd8iU6fm87Go5Zoy2PwmNyUyUnjIbDvDcDC
         AiMn1htVbSng+kbHCqrshYzMPRD/N2Pal9FCG/itB/Vdk3+MYnIUgnoP3aTp6JKvkxoB
         UUI5lUGwj38xyi7QwR3LeNyalLEjNFJPomUHUF/XMHh04m2SkBRysbI67EdKefxz4+Oq
         k83yepsRQIca5mRCvSZjW69FEm6Tf58NPThWshgVbFSoXMFJpfVb/8wSTwfmyPWG/AGZ
         n332QqTo01uz3JCJPh1U4angtJbFJrqlZgWMMMIAwWTB8sl3r/jOfilBBcFcrZwZNpA4
         g8ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=MAPoy+obUd69nqkSG4F2hKPgASuGSPy3QCknDbxk64I=;
        fh=Y/YWOAgPFazwB4n4tg8WI90Hv9MYDRqypMwLLdSQyHQ=;
        b=Gocihf0ctheuonT0cuCPOMyCAG5COv5tjJdkBZSSzj9R6bDyQyTY6OD2X30Dk9jCP8
         sZF8d3Q7fXhzxErpatXQeJrweS3tF/h2vpURrTCENPIV/zybN/IRWn0mdkaBfM1QMBLD
         6wc8J1fmy5Yyz5WLIuHh/WAkS8W89nf3mrXCEKLxHhJYIgjQ4r/xRucWr671DObfRyLQ
         8+wiWaidkeuS7IOn44OOJlVe7u+CXpvmm3XVsIBvjL9+6NyIJVc2VFted5Ql6pCof4v6
         iHC62j1fXwCP++0kU7WtX+4wHVCSCigutNA214ZzUpURD15NwoqJ+PU7MUx9SYEhY9tN
         2Kng==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794565278; x=1795170078; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MAPoy+obUd69nqkSG4F2hKPgASuGSPy3QCknDbxk64I=;
        b=rDpgFnpd5bGASGZKmUjSoDfA1BA0mueldZU3ad6Vx9a3tjKzNrKN1uBkRdycsWWQBz
         EKdutFZwkJwi+LD9CHT9kTiIBnEmyCkVMfXW4GDogpqsmNlIX37eOcZs+dQt6XN2HipC
         SPXN6jDdVKDwn5RGIuwRXE7YdN5gQS/raDWYqvP5g9RDA+rrcQPNJqCkFFtt/oyJF5+1
         lGKtxC2q5rdHQBv7rjkaIpke37C+OCAPZiqSyKNR/ZfpqQfR/X4grC+ri9FtS6vKhGmI
         vAhsMlNHmEBYb8DwcgbQ2QWnznLaM63hNh3lFnFCiSMgFnod+ywAWWvGQKjC/w5cKzw0
         g5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565278; x=1795170078;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MAPoy+obUd69nqkSG4F2hKPgASuGSPy3QCknDbxk64I=;
        b=u003UDxnxO3Nr2quXDUvCGL/S4Q6yuCNP5G7026+NxgHfcHlgP7q0dPKFjk/bZ4goQ
         PYfeXWeoWq2O1WlL08nR4+kdAj4yfjNke/xIi2c4fWUZojmMuF6gC1ZcxOpwxuehNoxc
         qQsfzG3M1Hl62ChCBwdealR3akIyb747U3lkIF6N9VATrvtbFtYmm6nFJFzRCnPaf4vn
         +koI0CQd/LivxN+jUlemnInY5SyMVUY3NIuJzxq1dh0QB6VvygB/1L6MQqdQB85NwqcU
         kXgedDwEBUvnLpd/yds/7q3tCk1d96KT8o1mZaAZiUthcw3ix4xxBtMIhP7qV701AtPG
         337A==
X-Gm-Message-State: APuU4Z+WcWxP0AbozACj/ja2+MQQ8HF4JSR4CNnQFqXK2kgslF3tA2rS
	AmKdrSL6rJREEZ6eAQcn0nXicNmNmEgQBhyQAOmMdTxr7HDwT5wgdUtwQolu5lFY3QJSp0gSA6l
	ZEKkYuZhv6GWpn10jR01nrBjYVw4pd18=
X-Gm-Gg: AYBFou1+puzbGCmXhFVC2f0u/fXWxrphBvP50KhVgmqLyabqO5Qm0xjM6PZgI/5Xl2/
	6zaOkqKc3pPCLl8f7KV5pjYCzhUxZffD4B8+T5ZzTgyxyIZaaPgJN6uMjq+BNtyJvJiIK0TybXc
	yXOTFzkFNg0IYXMf1fPaAYENX2tts975voZsyIbRhfZK58BEtpJ8Rb4u/5DSpZdGzaSLgrbKRw4
	5AYa00aWmCTcSZOTL5ZuTIdfOLtJbkSpBj+fM0MRKNfTez/nS3nxvKqaF/XhYjczHjaKE5a+lA9
	nZYwYCvjPymsbNS0HTqqN6sq2adOp7fnYXAYEiZ9aJrkXqs1o89bps08jvb9PdzWtXFc8mX84tW
	9jZjfocbSjUcSRFvhT7s10th5mIVIvhfVvSI/23VqFcLvkHDEScw49/qNHPFn3wT67Xam
X-Received: by 2002:a05:651c:b26:b0:3ab:3bf3:1606 with SMTP id
 38308e7fff4ca-3ae2b52ecbemr7965161fa.24.1794565278183; Fri, 13 Nov 2026
 02:21:18 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Ruben Pedrosa <rubenpedrosa993@gmail.com>
Date: Fri, 13 Nov 2026 10:21:06 +0000
X-Gm-Features: AclHuK_25jkOvz0nSARx5Boy1NO9Hrp_-HSBPcW6fvmunFBU0BNcj_ZBBVnqIUg
Message-ID: <CAJx0sk_pH2iHGYjGjSwg_ODJCPjjh=ogEdun-u6kh8V6KxcDKw@mail.gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath11k: use smaller DP rings on low-memory syste
To: eduard.hart@etik.com, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_022121_591346_D49E9BA0 
X-CRM114-Status: UNSURE (   3.85  )
X-CRM114-Notice: Please train this message.
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

Tested on a second TP-Link RE700X (EU v1.0, IPQ5018 + QCN6122,
256 MiB RAM), OpenWrt main 30a23ae45160 with this patch applied.
Running as a wired AP with clients on both 2.4 GHz and 5 GHz; both
radios stay up, no OOM, and settings persist across reboot.

Tested-by: Ruben Pedrosa <rubenpedrosa993@gmail.com>

