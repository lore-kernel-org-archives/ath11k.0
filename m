Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520B6606A31C
	for <ath11k@archiver.kernel.org>; Tue, 17 Nov 2026 06:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yWDm+Piy;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hu0j+pYj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=z0MIPVZXK5dLXw1tyO6HXqNIWUn9zD5Y4K9IC8LKwB0=; b=yWDm+PiyYTq5uT47d4ykn0DxT4
	CV6XLxzDmkwkSSmsZ/XVw/kVRQ4U8L9jfH7vrYIXQe3e9Lt1S5wZRyfmiL86/WshEDJLZcROOR/SC
	YJqDiaM5FVTyGeyCYS6kIIG4lIEMjF4nABaNWCGm57edfgaLHlhP9NTczf0KyjyxVbuGfJQBPRWQq
	VgvAp65MCtHE7eqRC/4Lkr9AXWyHpHZ0qLhUu8FWaaKux/2qst8IbS6R8UIsSk0tjOSpWbAsceQnv
	G5+T/Hm6OU+d1rF5Wm7iToKDmpOzO+h8Be5iZhL3OHxYvoApfmFaRoG4jeRAWyJMnYfrxVfRb2iG1
	S9iltCKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTD8Q-00000004hTg-0EP2;
	Tue, 17 Nov 2026 06:57:42 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTD8N-00000004hTL-1QE9
	for ath11k@lists.infradead.org;
	Tue, 17 Nov 2026 06:57:40 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-7d2db6408cfso3391929137.1
        for <ath11k@lists.infradead.org>; Mon, 16 Nov 2026 22:57:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794898657; cv=none;
        d=google.com; s=arc-20260327;
        b=CUR0I+XTy+89cjZELJRlScjrNNSxU646fVg8BZJai4KgFXYEI2NwAG2NR3wShZpBm3
         mCJnYmjnZXk/8vrQ6QBJ3RQyq2cpqtcl4mU9+6iTXm06fbbYkbxxy1kiDyDExDMl7RRe
         A/2iyDAH/OLEGCk86bmD5haZKTt0lI903ywtBHxwf2IpbenX1hy+vhEUvE2YlGEQaxOe
         RknCBg56GzFUZTTktXYvXkZDGtI1xbc3F/1dkh0XaWpaA7+zXXuhbZ3wbYpAeNXda1St
         n1vQ3mJ2nH3LVAAO+juhcdu2rv5gS7ezUnpJKGhSFLpvAsfX1ISuC1Cl0YNmBWpT/eIz
         es1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=z0MIPVZXK5dLXw1tyO6HXqNIWUn9zD5Y4K9IC8LKwB0=;
        fh=jOjeusGo2wCH5ON3Pcxw62uTlATFxd1/gqV5CB/O+nY=;
        b=s1V3uV0dlZefXEsI8zdsq6SoZjTNh1/AiBoymMTPvBcqY/5mlaOK6yqrJD8+9PQXJI
         nAl7QJob2o21eCnVQUGqnT9hrx7gEK8pRmUThGFh5eNsjrpsxBA33epu2yBW9HaQ5t9n
         4zQWZASaPQMmH/RY7QlfWN+S15VzApEMUEwhHBnKsMGoTYDIMQv1FmvuE8iky3vLCzG6
         AjN1mGV/P02rXO1kQxrCLWIzla296I+9wdg5lhB3BsJUFXuRuPf90Wb+PleX2g1CmQRu
         jo2oUwXHWMNdlxEZTgs0Gp9DLSsZiQEVLsEPxetTAhVVc9X8PQB7P7cy9+2nm2VTdW0j
         CP1w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794898657; x=1795503457; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0MIPVZXK5dLXw1tyO6HXqNIWUn9zD5Y4K9IC8LKwB0=;
        b=hu0j+pYjmkYgC9wJVkLKFKPfTRBfxXsfHTUDseIywRkyUzqlXLSOKai78zsgMHltNQ
         aoHak6v4dS5P6VFCyqvQ+JOvin3kiQiQ1Js3yt99hbZWhtdL9pDGwZ+Uv7s+39KhLXDe
         d7rzsAz7ZzjMQq/c96cXIKJE/3s5RljXQTc3X1Fl7gC/TyAUPWYe21cgIr4xOSAFZNXE
         kYqpcu9Y8mwll4GDlIXqKKC59YlwWcSe60Sbx72O39tQQsS2z+QL1Ync6kPXYo8p4e3W
         UWvP+iZt3UKfKOk9Z+ISCAEv0B8wYCVbqm+XaaFgAdMNhEFAibPMJczMJvO0Y7GlZCaR
         cvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794898657; x=1795503457;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z0MIPVZXK5dLXw1tyO6HXqNIWUn9zD5Y4K9IC8LKwB0=;
        b=vGzGfZedexe7eRWe5AMRnXL5xAw8yt/7C9tHbDBwsIwQhqGBcKfqm7HxhHFvaK3TiS
         /HMTItVuXcrybAadoncwcFO1w+XRyGY9TL27z6KPHY9THOHJqySVgRMMGZD6awvfZsFH
         z8nnZ8p3GR+YeTh4mUwnqY1FegqxXGgqIzBh+fcl/Im2um5n0t/FRHS6m37tk2bRObYX
         U6oQXzAFGWAePNBk1RaBFHzWV/PSA8Ce0yCKfgGwYWatScI4qy0HzWKgc/bFLUwyxt7T
         RcnknrbP6UAljYvRKlSEyDcH05uNhnaLAZudwcrct+NOYsdbteA8B1Q5I9cNQ8xaIii5
         +j0Q==
X-Forwarded-Encrypted: i=1; AL+hErEGyteQ6weY0V8buqRHAHeqLa2uqbNjegLNYRXakfsEZI7KrQzq9IP3rtpli81FqYd62mvkxrc=@lists.infradead.org
X-Gm-Message-State: APuU4Z/WLxeDDza0LHC/w79LfBqNVaagXq1KUqpsmPe4TQ1i91LgLaBv
	IMkqPsYHIQy6of3QtuJHT1yEkZw4E3K6nJiaHDlJqDEHYrpZaFYxCZaHG1b54m6TGcCPL3zx8uQ
	bsPrQ+HNQ8odEaAjkQOE/yHBmKPR/J9Q=
X-Gm-Gg: AYBFou1N1tOm6LsiqURRfLY2YSG+pMnly9w3SKGxe4y2LGPoTZfHu9GYDpL/QDNT39N
	ilHgEJjHR/IyHGEv4KhRTPdK301/BGYoIom3aXnFG/GH2MHhn38yO0nQwuWTaux+XvdWQOHApn3
	S1YWKrV4MtNQcX3unaWuXYti9qcTWnaqTul9rl62mAaGG282uI4Bi37tTkQ72dzsK3hAUhFd8Os
	164R+SJRB66z62Qyyo0zdlr/Q5Kp8u/XkqZm/qHQz/ABX1dc6lg+yl5j1WopZ+jPM0lk7ODZmlO
	KkUgPL17xPJ1iJrpumDwQrglLu1xj4LtZUHTg9qJfyY1a5KGOCUj4qa0TD8MntLacS5JIPhXunO
	tUacGK9PQcsSVLlEMeetBREDPO4KxVGn8HQCgxJgaMP2A8hMbHD2xf6YvJrQmrf2dOPXOjHRp/X
	sUr/VpBaEt6b4KMo72
X-Received: by 2002:a05:6102:6446:b0:7ab:af4a:f2f3 with SMTP id
 ada2fe7eead31-7d64d85ce1amr5054681137.26.1794898657452; Mon, 16 Nov 2026
 22:57:37 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261114-ath11k-sta-txrate-lock-v1-1-8331a03b1000@gmail.com>
 <a346e622-8fe9-4912-9ded-b531b1bdc82e@oss.qualcomm.com> <f7ecb009-4c95-4ef2-b569-3b2069298c41@oss.qualcomm.com>
 <243aa8d2-ca32-4827-8675-70be02b653d9@oss.qualcomm.com>
In-Reply-To: <243aa8d2-ca32-4827-8675-70be02b653d9@oss.qualcomm.com>
From: Christopher Griffin <christophergriffin05@gmail.com>
Date: Mon, 16 Nov 2026 22:57:25 -0800
X-Gm-Features: Aa3M54pFYlC-Sgy5IGuVMCgESJNKj3RQrP5QPbH7nXAX8LDwNvkwZk57mpQ5SL0
Message-ID: <CAKobHXA957LGe7d7+NdXrXWNYrF-7rs7WUx_YVS4Ft4q4kq9rg@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath11k: read a station's TX rate under base_lock
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_225739_407786_623D686D 
X-CRM114-Status: UNSURE (   9.38  )
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/16/2026 7:51 AM, Jeff Johnson wrote:
> Please check:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=9d8c2294a34e5ec38b674a8a1a5223522cfe3842

Looks good to me, thanks. Reading rx_duration and tx_duration in the
same critical section as the txrate copy is right, and the filled bits
set after the unlock are fine.

Two notes on the commit as it stands:

- The Tested-on tags are from v1. The two added reads are reviewed
  only, not run on the boards. I can run the pending version on the
  IPQ8074, QCN9074 and IPQ6018 units if you want that before it goes
  to ath-next.

- The sentence saying the change and the message were written with an
  AI coding assistant is no longer in the changelog. I'm fine either
  way, I only mention it in case that was not intended.

Thanks to Baochen and Rameshkumar for the reviews.

Christopher

