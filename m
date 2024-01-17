Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7278C47258
	for <ath11k@archiver.kernel.org>; Wed, 17 Jan 2024 13:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rNryY6hYZlO1btpN6zBV4mq9B44lFRLTK0qMjrq9rBg=; b=hmco0uzOi2B6Tn+DrznCiL6MG6
	rxGxe2OPIVKXzMkKCsjxjdQurw/Mc+qEkCtggkFDO5E2qbczyYXijJfNeBC+gyEjFP+1BLyed2EQw
	+fLtTbhaGMdxTT1SBN5upcV459WApjIRrks77CNAyCe9bSaj59ZUC6e6EMuxaeUkQ9W+9uZ6+h2lo
	QPMNYPIxatzUhpY6y13Ji8PfLTP7dgA4sSeEHe+osrqriTSESnZTrc2I34YJQzHuW03W5309sMbKD
	r2XCze/9xY1WkcNTEygpDkZBvfzvxtC8M4UEfv4Cez93h1zlqrFtKewmH6Y8CZuyYGM/Z1NEXKL4R
	cQapGezg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ6CM-00GeUY-32;
	Wed, 17 Jan 2024 13:43:18 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ6CJ-00GeR6-2V
	for ath11k@lists.infradead.org;
	Wed, 17 Jan 2024 13:43:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8D71BCE1C2E;
	Wed, 17 Jan 2024 13:43:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 107C3C433F1;
	Wed, 17 Jan 2024 13:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705498991;
	bh=rNryY6hYZlO1btpN6zBV4mq9B44lFRLTK0qMjrq9rBg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=PVDFa0qVeQgfcmtTLvCT/aURzwV29B744wxAwuaQ73mWhuWPqchRniFVuU5H5Hl+D
	 wvaaY+VBJHOffrmv/+3ae0fqYxsk1hjP+jAcoWZh5+f7Djg8ZFWQw6Wus7P6wHfAmR
	 gZLPkTtEMSRsWZp5XbLgDJyzbAn0VgO+15CCtdY9wr/QO6/o36gNoeckVCGNl5RYL8
	 0njz6HRmRyNVe+OYUDuq/RyHTfhQTqWrSfCrsjNXWtgzSvXEKccH7BaMuAV+vTdrZg
	 F4sRRbPDC5l4cAZN/jX4LN+hDJ7IfB2gB1hdtrhi55QHCCRfAxtKBNNrmlLglnHue5
	 HdAzIj0EiSXTw==
From: Kalle Valo <kvalo@kernel.org>
To: James Prestwood <prestwoj@gmail.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
  linux-wireless@vger.kernel.org,  ath11k@lists.infradead.org
Subject: Re: ath11k and vfio-pci support
References: <adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.com>
	<8734v5zhol.fsf@kernel.org>
	<87fa5220-6fd9-433d-879b-c55ac67a0748@gmail.com>
	<87r0ipcn7j.fsf@kernel.org>
	<356e0b05-f396-4ad7-9b29-c492b54af834@gmail.com>
	<26119c3f-9012-47bb-948e-7e976d4773a7@quicinc.com>
	<87mstccmk6.fsf@kernel.org>
	<df9fd970-5af3-468c-b1f1-18f91215cf44@gmail.com>
	<8734v4auc4.fsf@kernel.org>
	<e8878979-1f3f-4635-a716-9ac381c617d9@gmail.com>
	<285b84d0-229c-4c83-a7d6-4c3c23139597@quicinc.com>
	<4607fb37-8227-49a3-9e8c-10c9b117ec7b@gmail.com>
	<3d22a730-aee5-4f2a-9ddc-b4b5bd4d62fe@quicinc.com>
	<ee0280fd-032c-4f45-a3f9-50d96d8bed6d@gmail.com>
	<16cfd010-b62d-4385-92d1-002820a8db38@quicinc.com>
	<cdec259a-b779-4856-8585-f285179e3671@gmail.com>
Date: Wed, 17 Jan 2024 15:43:08 +0200
In-Reply-To: <cdec259a-b779-4856-8585-f285179e3671@gmail.com> (James
	Prestwood's message of "Wed, 17 Jan 2024 05:20:24 -0800")
Message-ID: <87cyu05b4j.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_054316_011774_5F34DC47 
X-CRM114-Status: UNSURE (   7.40  )
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

James Prestwood <prestwoj@gmail.com> writes:

>>> I don't see anything in the dmesg logs, or in lspci etc.
>>>
>> fee00578 is the physical MSI vector so I got it using lspci in host, see
>> ...
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Capabilities: [50] MSI: Enabl=
e+ Count=3D1/32 Maskable+ 64bit-
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Address: fee00578=C2=A0 Data: 0000
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Masking: fffffffe=C2=A0 Pending: 00000000
>> ...
>
> Mine looks like this:
>
> ...
>
> =C2=A0=C2=A0=C2=A0 Capabilities: [50] MSI: Enable- Count=3D1/32 Maskable+=
 64bit-
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 Address: 00000000=C2=A0 Data: 0000
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 Masking: 00000000=C2=A0 Pending: 00=
000000

And that lspci output is from the host (not the guest)?

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

