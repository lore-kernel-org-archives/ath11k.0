Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB493C25B77
	for <ath11k@archiver.kernel.org>; Wed, 22 May 2024 07:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otFBa2fFNWj2rsUxcEHKhjVJ8IwT//GKW/sRVwfUuHo=; b=IqjHk0UZyQDj/U9pmO81J35u/s
	PJFc2hNJWgTLU6mhIzIscovKabHf2eax7biBRCo7EQll6SEIxzmfGR7qIkXMyrmyZCwaaEbzjoU/l
	bsgci5bmf6I14rvWa7b5Fpkg0gVgTiiUEcolnrZ7K/FfGXrfwRhhkVMn7VMu0jYHH9QaVUwgG5xmu
	thGwOEaL5iX+NxoK34IHMX3KBsb2hvA5uYD9GMdbVdRdcNQvM61Qi3ccGIfXWqwx/ETNLbaGYtGMy
	sMtXsFqAsVsdmKKA424FvBO2GTZBK+iMb7fRGLNdK1FfydSdRfULqyqb/j5djSAIii3Q3AVaH523W
	rmMykgFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9geP-00000002G7V-2Aif;
	Wed, 22 May 2024 07:44:41 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9geM-00000002G73-2tcm
	for ath11k@lists.infradead.org;
	Wed, 22 May 2024 07:44:40 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-572d83e3c7eso10360575a12.3
        for <ath11k@lists.infradead.org>; Wed, 22 May 2024 00:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1716363875; x=1716968675; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otFBa2fFNWj2rsUxcEHKhjVJ8IwT//GKW/sRVwfUuHo=;
        b=oZgVLQ38yPdoA5Yg0An+HSlO/4f3p/UGH+XTHTs6wURTXXTdQmUzjsW0f5WxBRJTIV
         he2oYhJXfUrBL1OD/1NUYLZfFzG8dHhtdoozwPNhArjGbEQlHN2ul/MVAWX1puviy4SO
         +648juI32pyMAM3yN/eV7QlprPaBjNE+bbiTmilHd6GUwrf2WIRvsBCSeshoqjiz3Vis
         KSYZstdGHpXnz4armaAeVIR0qaTaGa08qxIkE33300nqOh0tq9AVjXEBSxAAHunrayAa
         Wm5r9h56BGGuK/6kyxbyUYx6p3CZEI4Wt41FBWl6ZO6zl9QmlsHkvj+C1auvqNDDRS+Y
         hHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716363875; x=1716968675;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=otFBa2fFNWj2rsUxcEHKhjVJ8IwT//GKW/sRVwfUuHo=;
        b=k+iKyJYV9jXXkx7NnvD3FLuGbv3cBS6F/RC++wgxrnl0nIauvZ1pZiT7EgsLteHbGY
         ocBMTaIxRtxnqScuk/N/ouFTPWBk+5ZU59Y0Y5Vwhe+Qa+e+iQ8rIq7nZMasIqdn8r8F
         jSOY1rf/1ss7qPJD/3P+3bGhNFUseAIVoJ0nhpkNzM7ZDoktE+wqH/Xk4hRRu2kQkvTX
         yE2I5H3W1HWkwHq35wTCFlVTfHxw+rXljUxt/yzhOe8I+1S5Vgp6pqNczBalxmIk1zrE
         HOCaOalFlpN8JUzu/tX3bVOLbtOXLU5IsykrhpC1JGG7gz5mPfApAOd6WgvGdUEbBeUg
         4UOw==
X-Gm-Message-State: AOJu0Yx4sHva+SW1Tkf5j+JBUpubB5C13kNN9tWZKhXnm5twDehMX7um
	TxRnxphPn8A/eeZ4N8n6S35JisoqoURHwapJizqVA2TLssn66eQ9Tw/e6UhnbTY=
X-Google-Smtp-Source: AGHT+IFKiy8iHMErmmG0rw3+QR/Cj47L+lxtbiDuEp4SLHGUcA6h7sx1wjpW7aUfEMIzH1dG2o8kBQ==
X-Received: by 2002:a50:d617:0:b0:56e:2f39:c5d2 with SMTP id 4fb4d7f45d1cf-57832a07d41mr651437a12.7.1716363875433;
        Wed, 22 May 2024 00:44:35 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-573413b2ac3sm17703276a12.38.2024.05.22.00.44.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 00:44:35 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 May 2024 09:44:34 +0200
Message-Id: <D1G07QWQX2VU.15LH8QOZ3L58U@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Kalle Valo" <kvalo@kernel.org>, "Carl Huang" <quic_cjhuang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath11k: fix WCN6750 firmware crash caused by 17
 num_vdevs
X-Mailer: aerc 0.17.0
References: <20240520030757.2209395-1-quic_cjhuang@quicinc.com>
 <171627868306.3970531.273322605619339350.kvalo@kernel.org>
In-Reply-To: <171627868306.3970531.273322605619339350.kvalo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_004438_992881_BEB7B18F 
X-CRM114-Status: GOOD (  13.25  )
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

On Tue May 21, 2024 at 10:04 AM CEST, Kalle Valo wrote:
> Carl Huang <quic_cjhuang@quicinc.com> wrote:
>
> > WCN6750 firmware crashes because of num_vdevs changed from 4 to 17
> > in ath11k_init_wmi_config_qca6390() as the ab->hw_params.num_vdevs
> > is 17. This is caused by commit f019f4dff2e4("wifi: ath11k: support
> > 2 station interfaces") which assigns ab->hw_params.num_vdevs directly
> > to config->num_vdevs in ath11k_init_wmi_config_qca6390(), therefore
> > WCN6750 firmware crashes as it can't support such a big num_vdevs.
> >=20
> > Fix it by assign 3 to num_vdevs in hw_params for WCN6750 as 3 is
> > sufficient too.
> >=20
> > Fixes: f019f4dff2e4 ("wifi: ath11k: support 2 station interfaces")
> > Reported-by: Luca Weiss <luca.weiss@fairphone.com>
> > Closes: https://lore.kernel.org/r/D15TIIDIIESY.D1EKKJLZINMA@fairphone.c=
om/
> > Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICO=
NZ_LITE-3
> > Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-01371-QCAMSLSWPLZ-1
> >=20
> > Signed-off-by: Carl Huang <quic_cjhuang@quicinc.com>
> > Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>
> This patch should go to v5.10 but I'll wait for Luca to test this first. =
No
> rush with testing, this is just a status update.

Hi Kalle & Carl,

Thanks for adding me to CC, I didn't receive the original patch (@Carl
maybe check your email setup why I didn't get that one?).

I've reverted the previous patch "fix WCN6750 firmware crash" in my
branch and applied this one and everything still looks fine. Thanks!

Tested-by: Luca Weiss <luca.weiss@fairphone.com>

Regards
Luca

