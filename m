Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68982E77182
	for <ath11k@archiver.kernel.org>; Thu, 12 Dec 2024 10:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQWPsqb5dnx5Cgd88nTV0WtwIDghydOgdWTFkBQtfIY=; b=eRiQh6OQWJZose8wx7l70SZz6w
	tYcE7UO5CHgPtIKi7ljfg2GlK+aV1d3gGeCkCAsM1hQs/MP7HnSsF8yOxsysW4xQUnoPAMCFMj1NJ
	4FGyC3nH0XT4tySPqN6kQ/HYwkiUiCx4WLGjHdFlHmgBpL95+1wVsNYfqfEc7DQcVUvV76GLeOCR5
	SzxpiMfXPklt6OUg5KltWy19y/HhVOkPm+Zc3PaRmGeIf1Bwdkn0p/5KzyWOPGYD3FcUlYIb4hX2C
	H3YmRkaWVqOA8l3ju0uUXAugcaXXmgG56dWtxTcFxirlJNcRn921IKpzhmf4tB3pKMYVrih0nkpZz
	Gxc3Bcog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLgsL-000000007Bg-2nwa;
	Thu, 12 Dec 2024 10:56:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLgrL-0000000070r-00qn
	for ath11k@lists.infradead.org;
	Thu, 12 Dec 2024 10:55:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 171FD5C628B;
	Thu, 12 Dec 2024 10:55:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 896CBC4CECE;
	Thu, 12 Dec 2024 10:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734000954;
	bh=zQWPsqb5dnx5Cgd88nTV0WtwIDghydOgdWTFkBQtfIY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=CmUrWJgv+WLqNGnv+QQ/BUgwct1IbJO3YKgnEBsx2Ew2Mmru1+sIlqtkVC/cT6lfF
	 0bckWh9tdTkS5kUHbRmI2MbVV1/RaDFWG1rq8lvIoBR+pdG94PsojQFajbpAf8pZ74
	 wGEoIbmeQf35Xmdta1DIAQRGFOZwlpEBKFs6NZ0w6kGan+EXdHJNIpQsAk4z+hdvkn
	 enMr2Kdx+ggN7pU1TMPPJQKZZesHMefhsALGCx7GLW21ipz8DO2pOyE9EZjstR3go6
	 QOz3vdG0dvhpCq9FzvSCPIfWlFt6oCi4TuE8+bIjmmFYA84cT3QxnDJbuGTjOnFdlO
	 Mp0f+ePNb5jhw==
From: Kalle Valo <kvalo@kernel.org>
To: wang chaozheng <ultwcz1997@outlook.com>
Cc: "ionic@ionic.de" <ionic@ionic.de>,  "ath11k@lists.infradead.org"
 <ath11k@lists.infradead.org>
Subject: Re: ath11k for QCA6391
References: <OSZPR01MB659723077AA21A568465CDEDD93F2@OSZPR01MB6597.jpnprd01.prod.outlook.com>
Date: Thu, 12 Dec 2024 12:55:51 +0200
In-Reply-To: <OSZPR01MB659723077AA21A568465CDEDD93F2@OSZPR01MB6597.jpnprd01.prod.outlook.com>
	(wang chaozheng's message of "Thu, 12 Dec 2024 07:42:31 +0000")
Message-ID: <87zfl1rwzs.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_025555_081413_838EA64A 
X-CRM114-Status: UNSURE (   7.38  )
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

wang chaozheng <ultwcz1997@outlook.com> writes:

> * On 12/12/24 06:35, Mihai Moldovan wrote:
>
>> Your kernel is very old. While being LTS and shipping a lot of backports=
, that
>> typically is not the case for new features. Additionally, even for LTS
>> standards, this version is antique (c.f.: current version of the 5.10 li=
ne is
>> 5.10.230).
>
> I known it, thank you.

ath11k even tries to warn:

[ =C2=A0 10.376639] ath11k_pci 0004:01:00.0: WARNING: ath11k PCI support is=
 experimental!

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

