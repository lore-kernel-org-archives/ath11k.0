Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35351E77183
	for <ath11k@archiver.kernel.org>; Thu, 12 Dec 2024 17:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWTVrxmG5W3tIhT6neWuRFNEJ1LBgRdw+hgIKFCMjK8=; b=mGZMhkXLgXQSIaaxzfhPd4x8Ig
	eyS8X5ahRAKr2YWd5WsyajlBgzgQPZFbSK6guBYbTEiNTOQWt+esAU/jLIDXVhfq13+z89TgpN94j
	cAUInpP8l/ZfVmGRdsOIOMeRh4+qPzC8/K6W9+VmJ07G6OB+mCbiNTEQ+ndWwJJWSdQN4ZUk1HT3L
	KUvFHDtqYGknYyvDsisADByfKnd2fZsa6Zh88VIZoDxaqYb8h2K55MdD+OjcwU3yosf7NW5fzJ+FD
	LZvmps1Sby+5apR2ysMX9cbpvHD9WzF7nQjPAQsXhdAO3Kwbh9jA1NerGPsVXowXwHr8f0/j3pgBg
	TzZbSZag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnFX-00000001Fpp-3iVF;
	Thu, 12 Dec 2024 17:45:19 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLn8k-00000001DeM-2H32
	for ath11k@lists.infradead.org;
	Thu, 12 Dec 2024 17:38:19 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-54021daa6cbso910038e87.0
        for <ath11k@lists.infradead.org>; Thu, 12 Dec 2024 09:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734025095; x=1734629895; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWTVrxmG5W3tIhT6neWuRFNEJ1LBgRdw+hgIKFCMjK8=;
        b=p6yd7ieb06SBV8f3f8r8YjbYmWuTWYN9fpcW99Yq93rB+Nsf1YnZ8eTBDGtesS8t9w
         w/cP5U8dfKyGfFUTCgXMMZLzIQm37BsPNqXtT9JXRc4XEWQfAnoP/rGWeOgNN2OqOyrB
         2aXuKlG2lWSpqc5QxVkHg6rPt0fWRmoZG/DdNZB/CtkwFyPMJ2khdASGVzrj60j0+UFc
         WCFz57wCQv0q6wtdSbtD/SAN6/5/eqiDcfHTN4Qm+6no/b1DTU+5Zf1Ci7CUx2iVOGxK
         cP2y+DwUzw57AF7xgJdfvywdK49A3Ju3w/h41B0RhrfDKiCdUFbZPn6GhJXsQL3a+2PS
         QnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734025095; x=1734629895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWTVrxmG5W3tIhT6neWuRFNEJ1LBgRdw+hgIKFCMjK8=;
        b=MZKWWOTjVUYqfVj87PgDpIeK1sZP8jyn1QizXlu8dMJWP1J2BPF2gHdvEYFddjsQ4m
         bEKNsrIr3LW3NVFXh8k0ftInKR8gKXGiM8XeXaB/a6ZfjNCkx6LfoHIIYAdzEqdSaBWs
         UzNqYZMg+9phzNLBCAhuGNRdU7tGoJYkkpjj4eIm4J+mPa87nTq7FVRog6FSpsWs0lDY
         qvKMYXL6B2rEC3Pd0N6/qhpqCaRXoNSOKDKmGdNp1/D+ecnBERJJwajvTzGnQrVU/3cY
         n2PT++tagxKgpNZDkSmk98HcRPyOXTfqzWWAVbTc65BccHzmUp4ezZGw5w9PM2TKb/G/
         UIBQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1hBB3NQXDXrgL6k0LQhO8gJEMojA39itBlBRcBS6ibsMA6krxllu5rznaCIujNqEthv5Udcc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/fgy2M4Whmrzrnyf44916MSTVvCIMlfa/t4T7CYKbhNQYfgXM
	06IlnhOHhwWRgSsoIpE0dfwn94Q+sCenKbTtQ+I0gGftITXZ8RKyOls5wMFPkHurBPbOpnnTjmY
	eFTczLE8VY6nvhgb4WecDpHxWE9IPlz1betWL
X-Gm-Gg: ASbGncsQG0khFf97bhu6Mu8Fym2JXobefo2kN8m3/j0YqkUo0FNZDrtX0GfzqnUyawd
	Em0tvWYXZX+Y3h8gQvaGT7Mg70LVmfrz/j2eLGQ==
X-Google-Smtp-Source: AGHT+IH015phUurBpWFmQa3s3RBwJ8PNrtRSaF1ujp3Q451/4hYQAF7Ccw77Ht0ZKlUC+7RE7PoqmmdadfJXIZMtLLU=
X-Received: by 2002:a05:6512:124f:b0:540:1e51:b919 with SMTP id
 2adb3069b0e04-54034112534mr504071e87.31.1734025095447; Thu, 12 Dec 2024
 09:38:15 -0800 (PST)
MIME-Version: 1.0
References: <20241212-netdev-converge-secs-to-jiffies-v4-0-6dac97a6d6ab@linux.microsoft.com>
 <20241212-netdev-converge-secs-to-jiffies-v4-1-6dac97a6d6ab@linux.microsoft.com>
In-Reply-To: <20241212-netdev-converge-secs-to-jiffies-v4-1-6dac97a6d6ab@linux.microsoft.com>
From: Praveen Kaligineedi <pkaligineedi@google.com>
Date: Thu, 12 Dec 2024 09:38:03 -0800
Message-ID: <CA+f9V1OK39b5hNoVZqu6AfPJqGsB4_5iyAK24Oit-tjmxrk7jA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 1/2] gve: Convert timeouts to secs_to_jiffies()
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Jeroen de Borst <jeroendb@google.com>, Shailend Chand <shailend@google.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_093818_578220_D5557C15 
X-CRM114-Status: UNSURE (   7.13  )
X-CRM114-Notice: Please train this message.
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

On Thu, Dec 12, 2024 at 9:33=E2=80=AFAM Easwar Hariharan
<eahariha@linux.microsoft.com> wrote:
>
> Commit b35108a51cf7 ("jiffies: Define secs_to_jiffies()") introduced
> secs_to_jiffies(). As the value here is a multiple of 1000, use
> secs_to_jiffies() instead of msecs_to_jiffies to avoid the multiplication=
.
>
> This is converted using scripts/coccinelle/misc/secs_to_jiffies.cocci wit=
h
> the following Coccinelle rules:
>
> @@ constant C; @@
>
> - msecs_to_jiffies(C * 1000)
> + secs_to_jiffies(C)
>
> @@ constant C; @@
>
> - msecs_to_jiffies(C * MSEC_PER_SEC)
> + secs_to_jiffies(C)
>
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
Reviewed-by: Praveen Kaligineedi <pkaligineedi@google.com>

