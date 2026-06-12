Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E89CCD98CE
	for <ath11k@archiver.kernel.org>; Fri, 12 Jun 2026 15:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6+TDJXVkZEdcmhC7QL7gnqoMVbu8ebFypn+5HhBnCM=; b=vnKnEcWm8SqyeJQEjaMruCeDuB
	KB5QEZKgvyqV4c6LIsfRltg17gClCsKwkrXnMfGoDdU873ZhblCyW52zIdgrwV4Qh+hePitMUfy5R
	eFiQ/7jw0GhDOFP2LAqvBHdVEwhHUcoVLZxFt6WF+3C74PRuF4IHWcp8o9YSDLtAnYCfBuuY679G4
	921VTpEKSFpORjt18s4mNjnoLNdwVD4q9kbEeQbEquUidmE3jnjLuyr/lpK0y8hkwu9WQwOnHJWsR
	RnDJ2F3p3rkPJFmxlY+N93umM9Aibu8ZiuKCkys94qb1cXqjhV9od5eUQZAz5wtwa9Bn981PqkNYF
	ewOChtEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY45h-0000000BBDx-0FAO;
	Fri, 12 Jun 2026 15:46:41 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY45e-0000000BBDV-2WJi
	for ath11k@lists.infradead.org;
	Fri, 12 Jun 2026 15:46:39 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-66062a414fcso1278309d50.1
        for <ath11k@lists.infradead.org>; Fri, 12 Jun 2026 08:46:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781279197; cv=none;
        d=google.com; s=arc-20240605;
        b=GteH4uI7xSOU4lLq2pgIp8I33O6dJhn7nE36+gaMffzQoy0vNI3Um3drfWqnaV9Iu8
         LUzgqG3Su5i6t0p12W8IUVuPhUslEFJnxcsDyWwW4VSlMXjhiDUFHKQjj0Kb4B0nHdpB
         Up4xQynGihaNn1IHabswYIRv2nwvoczA59itURFlNlF26w6YtAfe1xS5pu3q1JnfYj2X
         kJLsQL+ezZAh6yi1SoYrsZh7Iy1U/XiTX09KFgfYOXp2KnFWM8c8twh5MSewl3ik5TNj
         U5mvWj02Frm+dGZu0cDhTDOSlTyvbEXypP5PHWrN3vJw0W2wFu/b5IC9Q257vdsz3tyU
         hKwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K6+TDJXVkZEdcmhC7QL7gnqoMVbu8ebFypn+5HhBnCM=;
        fh=HgKaeyh4yMxGcoinyTIMjEevHyigGlMHhG9LiR6LN/Q=;
        b=JKST+RISeiIzHBuaB4ywVLgG9GLjoeJsG+8vpK3TIa9WO9EPobk2R187dfzVmhfH1E
         fXzz9A5cf9VCv7T6nPllLsQ5bHy//5XbKSyComzBjZwwAIThzpiwrdZnorvVPFG3Ssvl
         yuz3LAi309hDeDqr1dLiF3pbeGOXxM6z2/JKwhg39Yt1jvJQ1QGVCgpmDFtLxMJste+z
         ENmhTHLxswIs/cbYyYRG9f6OS7FvFg/0l/ytSYDJ1IUGZXCrvuDOs3VX7I7dO5SQms93
         PvhxAGtT8G+0tv1U5/3RSfwOpUY92esi5yef6LjQcGtA7Jp+YZvdjsLcLf6jKUEFtt2e
         xdTw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781279197; x=1781883997; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6+TDJXVkZEdcmhC7QL7gnqoMVbu8ebFypn+5HhBnCM=;
        b=rhf8qCkEbJ1UohagZKu1j0iCe3TFsO0vncxI7wHpDHmre+Z2RIc9yi0+BB4Jb6VKcx
         kKMXKSFfKNyE0cD0/HygFx3dqcv8kkJ+1hr2+v7QfOPvcugDcZzfp2T8W4ftPfnVCyF5
         wc75warhrTjhu0ZgWmhlYq81tWgHo6BK6sbwc1EP82f7/A/d4vPkNRMUtZzUXn1hzgFx
         88pbFHA/GZLxl0VwEqJ26AKU3s/fXdie5ftYO5TinbaMkpuqzyIjDiBgtdZ5txJaX8aZ
         sVFtXAR6ouPk3AaanO48/xc33Hsz0cXcqNjVWQdgGL5IoeNcY0IH0AaBtsMS+uvkvTzG
         q01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781279197; x=1781883997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K6+TDJXVkZEdcmhC7QL7gnqoMVbu8ebFypn+5HhBnCM=;
        b=BhRQAfc3NJw31hixpVUt9XDXOLa3RrGRWrTxCxsuNxEkSPm9gDaT3KaCEnNB/QWJ/P
         PVTtClbLkmCgD/9bS3bfau1OLGGeckUotxqhNe2YdiBQwKEwWsLsJXGfOTDtLR7jJyd2
         Iqxy6jHKNcqgStScqjaYJqPabiERdPEryqk6Zw0Q+MXscOi2PznFabB9E3ZngyNAr+dw
         qc3mBLylce/6FPhbef0M1Yid1r+qyygP6jC+CD/ade1+/7kpPaNQG4NWczREkmHd8liZ
         /54Si+ErpTAZ6jBcNZct4tAPXdqK0CgISho3/rsS1e6a/he6+O+rYapAb1s2y5iXGyGi
         L0wQ==
X-Forwarded-Encrypted: i=1; AFNElJ866oaOKn6gCfs3FaYzP0gsbuuhHN32OSb00ZZtQF+XPtzZQ17q+zRmGMVjMMk2XcJv36K9MXs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0pEz873vEEIRWh+lql2UZ0h3qiRrZRB9t/xx8jVl4n+b3tGfJ
	FChBj3Egv/EPvCaJcSSbdJQ46stG6BKdpFgbCg7nnUKQxMKMYz/7WzwQUo3OSRzUkwKiYsfciKS
	msNmImpRxxUxQCme8ci8G3XC9/w63yyE=
X-Gm-Gg: Acq92OEkqPOySiPJZcbgTT839TKhYAjDm2sY8Nda6mpYlDZOUoHUdy4AezW2lpfMOAt
	3FU4GEc+7w5N6CWs68PiNsPCFAHryVYDu/yHcofq3QHKNKDlIx+J89LehEkCIEd4EPGVcAOVMni
	bjxJrJeoodTnlqnEJ9ebKvP87F/l7Z0YC1FcAd0U6QdUeMrMzqb75qgHtblzZWbdUz7SZDSWmhG
	l/2yaSHiPtrhZbYYiU9T1fe8vvqtvNO6iQ92GqG0kv3dmfDfDi62FA4fkE+SDlhiCFiuuY1AkxN
	tCUZNQYp2IPXaU2nTlYMWOBLAz+Fd8iqVFVRRzCuDdjBuSHtdBQmhIjVGJYWsakdHfolww==
X-Received: by 2002:a05:690e:419b:b0:65c:7129:5c66 with SMTP id
 956f58d0204a3-662782d4c92mr2935747d50.41.1781279196694; Fri, 12 Jun 2026
 08:46:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-2-393322b27c5f@fairphone.com> <DJ757RE8OYHO.2XEXNTLVIJ497@fairphone.com>
In-Reply-To: <DJ757RE8OYHO.2XEXNTLVIJ497@fairphone.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 12 Jun 2026 12:46:24 -0300
X-Gm-Features: AVVi8Cc-RlrekTPykssUtkucAEzJ495V9LRVQKNsNE6WJFZ19JGNTXkFLsVH6_4
Message-ID: <CABBYNZL_FmgjOKP-rNzc6e=m8oHdzN=7cLbvLqcHi1Otpa8puQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: bluetooth: qcom,wcn6750-bt: Document
 WCN6755 Bluetooth
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Koskovich <AKoskovich@pm.me>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Jeff Johnson <jjohnson@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_084638_642948_955DBCBB 
X-CRM114-Status: GOOD (  16.85  )
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

Hi Luca,

On Fri, Jun 12, 2026 at 11:33=E2=80=AFAM Luca Weiss <luca.weiss@fairphone.c=
om> wrote:
>
> Hi Luiz,
>
> On Fri Apr 3, 2026 at 3:52 PM CEST, Luca Weiss wrote:
> > Document the WCN6755 Bluetooth using a fallback to WCN6750 since the tw=
o
> > chips seem to be completely pin and software compatible. In fact the
> > original downstream kernel just pretends the WCN6755 is a WCN6750.
>
> Could you please pick up this patch (or provide an Ack if you want Bjorn
> to pick this up with the rest of the series).
>
> Regards
> Luca
>
> >
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> >  .../devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yaml     | 10 ++=
++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn67=
50-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-b=
t.yaml
> > index 8606a45ac9b9..79522409d709 100644
> > --- a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.y=
aml
> > +++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.y=
aml
> > @@ -12,8 +12,14 @@ maintainers:
> >
> >  properties:
> >    compatible:
> > -    enum:
> > -      - qcom,wcn6750-bt
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - qcom,wcn6755-bt
> > +          - const: qcom,wcn6750-bt
> > +
> > +      - enum:
> > +          - qcom,wcn6750-bt
> >
> >    enable-gpios:
> >      maxItems: 1
>

Acked-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

--=20
Luiz Augusto von Dentz

