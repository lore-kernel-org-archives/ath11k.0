Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3596DC27C40
	for <ath11k@archiver.kernel.org>; Wed, 23 Aug 2023 18:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fgRULWkz/E67tN90MDtd6wGZkfGafd+GYua+I1MBEUk=; b=JYW0Yk5+QThi/TNnw1Fsmj0TB3
	hJVyVftTk6H4mYG65u26muatgdRQfqcVOq/LyvSOQrJDD4GdN+5rIZqXykQb8YkNob4pTm6oYZRzC
	XkiOi7zm3o8wnGMPFmkE4R7w8ErxEBW588gdPCociOO5P9GbAwjzv7UojM8AxdQxnE62OHEJOi04h
	MiHIgyLmqznU+VpdsW42XEcQSgYShYLo4Zsx5v2D2Rsvy8MKwimRQ+UQ+qb14B6+IHTydbST5D/2x
	OuqOFu/v43v3xNjCgFYRUcK/kVYMfbHKQeCjCBTQRarvRmG3IO77/JNpm1OOcOAng+MvFjDUnQIDO
	C9ow+sdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYsD0-001HBV-0x;
	Wed, 23 Aug 2023 18:03:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYsCw-001HAY-2p
	for ath11k@lists.infradead.org;
	Wed, 23 Aug 2023 18:03:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D6282654C7;
	Wed, 23 Aug 2023 18:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7549C433C8;
	Wed, 23 Aug 2023 18:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692813833;
	bh=0zDTi1uOchDkfTsQ1sXBAVST+n+bUDwVoftDqwhHlHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A0+VcsbEDYgspwstRkBcfXH59khMCilDmfCxhZar36w6Nbx5q7yARDkmQm9Cs4xbt
	 n0MkwI8/M613/DBkMfkFye14BXq9Pdhq522sDzQAxJs1sZp1LQinO8VZQI9BUs4GwD
	 5NXIBTqWNSUPNQtsP9RdjWIf1gDRNLAroq+whrBFJT/3QitHNRwBO8+maNgXaOMLqo
	 +ymYcwDOiQdQkfGDfZqZKEqoWTrKlDQHuO5Eu7b3d9r5Dl2AKUwOCylC8pQ9+U8BJE
	 UrQp6yYuUMlGahKZZXF+Srx1TegpJBXnTkFHRr0u0jV8eDVTypT1f2dZkh4qAeWiDc
	 PLp963qAzBTKQ==
Date: Wed, 23 Aug 2023 14:03:51 -0400
From: Sasha Levin <sashal@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Kalle Valo <quic_kvalo@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
	quic_jjohnson@quicinc.com, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 6.4 03/10] Revert "wifi: ath11k: Enable threaded
 NAPI"
Message-ID: <ZOZKB5J+Xwu+41Xw@sashalap>
References: <20230822113101.3549915-1-sashal@kernel.org>
 <20230822113101.3549915-3-sashal@kernel.org>
 <ZOTcGEfqsBkWugAa@hovoldconsulting.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZOTcGEfqsBkWugAa@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_110354_975883_A16D3B4E 
X-CRM114-Status: UNSURE (   9.42  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Tue, Aug 22, 2023 at 06:02:32PM +0200, Johan Hovold wrote:
>On Tue, Aug 22, 2023 at 07:30:53AM -0400, Sasha Levin wrote:
>> From: Kalle Valo <quic_kvalo@quicinc.com>
>>
>> [ Upstream commit d265ebe41c911314bd273c218a37088835959fa1 ]
>>
>> This reverts commit 13aa2fb692d3717767303817f35b3e650109add3.
>>
>> This commit broke QCN9074 initialisation:
>>
>> [  358.960477] ath11k_pci 0000:04:00.0: ce desc not available for wmi command 36866
>> [  358.960481] ath11k_pci 0000:04:00.0: failed to send WMI_STA_POWERSAVE_PARAM_CMDID
>> [  358.960484] ath11k_pci 0000:04:00.0: could not set uapsd params -105
>>
>> As there's no fix available let's just revert it to get QCN9074 working again.
>>
>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217536
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>> Signed-off-by: Kalle Valo <kvalo@kernel.org>
>> Link: https://lore.kernel.org/r/20230720151444.2016637-1-kvalo@kernel.org
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>This commit break machines like the Lenovo ThinkPad X13s so please do
>not backport until this has been resolved:
>
>	https://lore.kernel.org/lkml/20230809073432.4193-1-johan+linaro@kernel.org

I'll drop it for now, thanks!

-- 
Thanks,
Sasha

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
