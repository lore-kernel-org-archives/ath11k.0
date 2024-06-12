Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BAA4C27C53
	for <ath11k@archiver.kernel.org>; Wed, 12 Jun 2024 12:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c03kX+wi2oUkudtBTpI3lEjHXSbtjAvyd8CkG2LgP/k=; b=sh7C8o3Eq8/jioOTO8q9Q0RuuR
	vuau95khwagdh9GmaQ8dIJ9c9nzzhWSEuM7V8IcUMV/q4Yx9OBOVNE+JIH8vFM/77BkbCeXnnrr8w
	kTJAD0Fp3mgqsNEAfaBTwYhUJEWKaZRsuXsx32fslsAA0ZHxL7oq5vpcLCFeDAuoTxDv8oOOC1bXv
	eKNUnjOZabZhTAQgClFUfBMWdYZ5dGfsEKgbU/KomOadWaR86conV3lzTr3hAT2F4yo4Rm8VYu3iq
	MC1xBpULWM2eeV8h6sXIVbuy1Qc4gvzXa5og9STGEoecC57LuBpr6bpmmoFMxLGfcZoGemjMEIlw0
	y5h9P9eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHMkW-0000000CXCa-3Srb;
	Wed, 12 Jun 2024 12:06:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHMkU-0000000CXCB-0G6z
	for ath11k@lists.infradead.org;
	Wed, 12 Jun 2024 12:06:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 53D7D61408;
	Wed, 12 Jun 2024 12:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47EC7C3277B;
	Wed, 12 Jun 2024 12:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718194001;
	bh=00vPD93kJUmCxjtL2ZOh+LvycvFt+ZvpgyuiE6ZabKY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=WiKHMZahjCve3aSq319O0D33gyjCeRSaZzbLIOthnjgXxVm0HSOLJ/NUddAw1JeAl
	 AWa4c2/Z8QqThEAbE38lJBRbeQpuiIbmBpgjcJAdcNAV3fXk3tmweBO96klwUwoFis
	 qnat3AzWJuOoVwGIqkrEPRc58utr0iHEt8dFyh/LclTDulDf5MYBGK+vTndm3jFx5v
	 Xug4J9qLzTTmvq8hzUl3m7ijI/2+XLsPjWBOyuSCY9W2/bdAkLXTDaSeuChZ3WCGw4
	 eq0aAH7jf2UjA/pu63MrBalbNSiFCnH8bMbttXEHDJ5uHOX30IWL4RO5A4/KF9mAQo
	 jj5jzlKunt4Ww==
From: Kalle Valo <kvalo@kernel.org>
To: <andrea.marcer@external.marelli.com>
Cc: <quic_rajkbhag@quicinc.com>,  <ath11k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>,  <quic_gsaminat@quicinc.com>,
  <Dennis.Damore@marelli.com>,  <danilo.sabato@external.marelli.com>,
  <giovanni.ciaramitaro@external.marelli.com>
Subject: Re: [PATCH v4 0/4] ath11k: factory test mode support
References: <TYZPR02MB7247209AEA8B450DB501972ACDC02@TYZPR02MB7247.apcprd02.prod.outlook.com>
Date: Wed, 12 Jun 2024 15:06:37 +0300
In-Reply-To: <TYZPR02MB7247209AEA8B450DB501972ACDC02@TYZPR02MB7247.apcprd02.prod.outlook.com>
	(andrea marcer's message of "Wed, 12 Jun 2024 11:46:55 +0000")
Message-ID: <87r0d2nz5e.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_050642_185753_BA01333B 
X-CRM114-Status: GOOD (  10.48  )
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

<andrea.marcer@external.marelli.com> writes:

>> Device is booted in factory test mode to calibrate the board.
>> The commands are sent from a userspace application, which is
>> sent to firmware using wmi commands. Firmware will send the
>> response back to the application which stores the calibration
>> data in caldata.bin file. This file will be loaded when the
>> device boots up normally next time.
>
> I would like to calibrate and generate test signals on a QCN9074 
> chip using the factory test mode. Which userspace application 
> am I supposed to use to perform the calibration and tests?
>
> QCN9074 PCI WLAN.HK.2.5.0.1-03982-QCAHKSWPL_SILICONZ-3 
> Linux Kernel 6.1

To my knowledge there are no calibration tools publically available,
unfortunately.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

