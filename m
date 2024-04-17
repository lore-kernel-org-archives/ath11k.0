Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0B3C04FF9
	for <ath11k@archiver.kernel.org>; Wed, 17 Apr 2024 11:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5hzFpqDeiSvh3i5/NNbcyOTjOMmoOjEjWS33BvjzzU=; b=oriILvNtBr8e6MufaCP0vIi03m
	RrkDw0tDfi8BRq01IoC35wLcFGT3nn3nZDv09zf5b3CgYah3rsg8Ug13k4Jy9VQfMvU8l/mLEmjL3
	S1B50USRI+Cd7YjHQjEMMmZekep3nBBgOVEjSidUmCEYu/QrGyO1/qjXV/ICxLtpvCeW5ZLlxxh2+
	BqJ/KBja2Y+/dM3g9U/hxPnOLQzN4ostET7TZatkE9a9UANnpB+3Be5Xa1e8MINOxHeDpCv3rYHMv
	9nDYGg97bap99tWjWr9Zlm9hItLjkkl02uTHSPdzgX2+n3ekxRL/tgLswrkETzenndaygCvhqCmPh
	6F11z8Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx3Cp-0000000FjYr-3F3I;
	Wed, 17 Apr 2024 11:11:59 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx3Cl-0000000FjVm-2x9e;
	Wed, 17 Apr 2024 11:11:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=j5hzFpqDeiSvh3i5/NNbcyOTjOMmoOjEjWS33BvjzzU=;
	t=1713352312; x=1714561912; b=i0QDDimFSwURDLsMdan+XoC5OYmELJmrjKD5IQlPfrxpd6L
	5YvK+iE26qZpMZjK+LzzXzL2dROn7RMfbVh7oVnlJ/7VD0iweQSLDfjn7QDO35onCuom8bRWCVq0b
	lGAFlWan2eJoWFFtQa4/epuoqnM6ualG/25KtLItOiBwQw1KcZwred3r2hOXNdr80Y2XJn1lXyUti
	LIK9S0lBd7K87E9a8wBX+0JkHBt8nRJaApuGTTADb958k9HOZkEBmEsXUemPaiTxd6IG6hvcU761h
	d6ZTYuy+3aNi0wF74GtrGmJDy5l7bEtWNM7xsY9B8kB84bS3KIWht7ZpYjddOCrg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rx3CW-0000000AtjI-1eSv;
	Wed, 17 Apr 2024 13:11:40 +0200
Message-ID: <e0d5741ee053c11fe078fc8afe6cf4a92e274095.camel@sipsolutions.net>
Subject: Re: [PATCH net-next v6 03/10] net: create a dummy net_device
 allocator
From: Johannes Berg <johannes@sipsolutions.net>
To: Alexander Lobakin <aleksander.lobakin@intel.com>, Jakub Kicinski
	 <kuba@kernel.org>, Breno Leitao <leitao@debian.org>
Cc: davem@davemloft.net, pabeni@redhat.com, edumazet@google.com,
 elder@kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,  nbd@nbd.name, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, lorenzo@kernel.org,  taras.chornyi@plvision.eu,
 ath11k@lists.infradead.org,  ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, geomatsi@gmail.com,  kvalo@kernel.org,
 quic_jjohnson@quicinc.com, leon@kernel.org, 
 dennis.dalessandro@cornelisnetworks.com, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, bpf@vger.kernel.org, idosch@idosch.org, Ido
 Schimmel <idosch@nvidia.com>, Jiri Pirko <jiri@resnulli.us>, Simon Horman
 <horms@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Sebastian
 Andrzej Siewior <bigeasy@linutronix.de>
Date: Wed, 17 Apr 2024 13:11:38 +0200
In-Reply-To: <ebe80c29-4884-488d-ab83-c020f9c3bc81@intel.com>
References: <20240411135952.1096696-1-leitao@debian.org>
	 <20240411135952.1096696-4-leitao@debian.org>
	 <20240412191626.2e9bfb4a@kernel.org>
	 <ebe80c29-4884-488d-ab83-c020f9c3bc81@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_041155_765267_60B590FE 
X-CRM114-Status: UNSURE (   5.49  )
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

On Wed, 2024-04-17 at 12:51 +0200, Alexander Lobakin wrote:
> Just FYI: kdoc accepts only this pattern:
>=20
>  * @last_param: blah
>  *
>  * Return: blah
>=20
> NOT
>=20
>  * Returns: blah

Actually, it does accept that, the regex is "returns?". It's just
documented only as "Return" . IMHO it sometimes reads nicer as "Returns"
depending on how you phrase it, but ...

johannes

