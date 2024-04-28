Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9039EC4345F
	for <ath11k@archiver.kernel.org>; Sun, 28 Apr 2024 12:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hHUahLrMyWRrlTG2ckWoaVOAX6iPHfvsJqGLHw78ruk=; b=aPaU7ulhG3Mxeamp+h4hToVqtM
	YFDfWnR6EQ00cb9YapuQ06cIfkOA2gHyODjQ2rDLSZCmnh8oug9Sa8Rpj4i0g6VQyzArIcRdgtl5+
	kbQs2i7mha5EztOmSM7E7cLAj78hiSwiqFIEeKJPtJnIIuRN9PwnmMmcdpKpwLhGUyGMyAfwXaxEM
	1gBze62kCDmoXasvKuDDRFX8tK6Y4+fcxb+yKOJCXahZwpjeMVwYPg5ylJCJcAlMAXMXlWWoTHNMK
	DLzfuBQiqR2MwyF7XB9RvPdmm2gXSjNJaU/aCpYTTGO26s27ziK57XkYxYxEcxuVy3BaQzDWxj/fk
	yp2K/fgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s143f-0000000HZKq-2bat;
	Sun, 28 Apr 2024 12:55:07 +0000
Received: from m16.mail.126.com ([220.197.31.6])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s143b-0000000HZJj-2rDu
	for ath11k@lists.infradead.org;
	Sun, 28 Apr 2024 12:55:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Content-Type:Mime-Version:Subject:From:Date:
	Message-Id; bh=hHUahLrMyWRrlTG2ckWoaVOAX6iPHfvsJqGLHw78ruk=; b=Y
	dbdm4mhxPP84Ltf3AW5IV9kw+s2KKMr70Q8bRmXhXZjGxRrtCFkyz33E67NvMyNv
	NWNU0dLrEExYuwu8PSgpxJQYx1VFqBIJfUv7NLv0IRxIrn0OlSgTpHqal3Vi5FNI
	XhdSZfOSMwVnt/WvoNf6wOQU4thYjcQFUWICZXmdLg=
Received: from smtpclient.apple (unknown [120.231.220.21])
	by gzga-smtp-mta-g0-0 (Coremail) with SMTP id _____wDn75wWRy5mPdcnBg--.57798S3;
	Sun, 28 Apr 2024 20:54:48 +0800 (CST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [PATCHv3] wifi: ath11k: skip status ring entry processing
From: Meiyong Yu <meiyong.yu@126.com>
In-Reply-To: <c8812227-ae90-4bbe-9fd3-425b61e36838@quicinc.com>
Date: Sun, 28 Apr 2024 20:54:42 +0800
Cc: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>,
 ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org,
 Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
 kernel test robot <lkp@intel.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A8B8371F-2FF4-45C7-9BEA-BE7FD5CA288F@126.com>
References: <20240427091248.2013946-1-quic_tamizhr@quicinc.com>
 <c8812227-ae90-4bbe-9fd3-425b61e36838@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-CM-TRANSID: _____wDn75wWRy5mPdcnBg--.57798S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxGw13Gr1rWw13tr15Xr43KFg_yoW5Xr17pa
	yFgan0kF95J34xJw4fXF4xZF15JanYq3y2kr4xA34fWr4jva4fKFnFgrWUJF98CFW5Ga42
	vr42qw1qkayqv3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UjzuAUUUUU=
X-Originating-IP: [120.231.220.21]
X-CM-SenderInfo: 5phl501qjo53a6rslhhfrp/1tbiOxvOhmVLaYi6igAAsX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_055504_313411_641E802A 
X-CRM114-Status: GOOD (  16.04  )
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



> On Apr 28, 2024, at 6:46 AM, Jeff Johnson <quic_jjohnson@quicinc.com> =
wrote:
>=20
> On 4/27/2024 2:12 AM, Tamizh Chelvam Raja wrote:
>> From: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
>>=20
>> If STATUS_BUFFER_DONE is not set for a monitor status ring entry,
>> we don't process the status ring until STATUS_BUFFER_DONE set
>> for that status ring entry.
>>=20
>> During LMAC reset it may happen that hardware will not write
>> STATUS_BUFFER_DONE tlv in status buffer, in that case we end up
>> waiting for STATUS_BUFFER_DONE leading to backpressure on monitor
>> status ring.
>>=20

Can you known the LMAC reset event, if you can known, you can set all =
the ring entry
status  to done after reset is done, and the logic of code will be more =
clear.

>> To fix the issue, when HP(Head Pointer) + 1 entry is peeked and if =
DMA
>> is not done and if HP + 2 entry's DMA done is set,
>> replenish HP + 1 entry and start processing in next interrupt.
>> If HP + 2 entry's DMA done is not set, poll onto HP + 1 entry DMA
>> done to be set.
>>=20
>> Also, during monitor attach HP points to the end of the ring and
>> TP(Tail Pointer) points to the start of the ring.
>> Using ath11k_hal_srng_src_peek() may result in processing invalid =
buffer
>> for the very first interrupt. Since, HW starts writing buffer from =
TP.
>>=20
>> To avoid this issue call ath11k_hal_srng_src_next_peek() instead of
>> calling ath11k_hal_srng_src_peek().
>>=20
>> Tested-on: IPQ5018 hw1.0 AHB =
WLAN.HK.2.6.0.1-00861-QCAHKSWPL_SILICONZ-1
>>=20
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: =
https://lore.kernel.org/oe-kbuild-all/202303281719.CvnPkOiK-lkp@intel.com/=

>=20
> I believe these are misleading. LKP didn't find the problem you are =
fixing, it
> found a problem in the implementation of the patch.
> So I would move these below the "---" so the LKP knows the issue it =
found is
> fixed, but the git history isn't itself isn't misleading
>=20
>> Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
>> Co-developed-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
>> Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
>> ---
>> v3:
>>  * Rebased on top of ToT
>> v2:
>>  * Fixed compilation warning Reported-by: kernel test robot =
<lkp@intel.com>
>>=20
>> drivers/net/wireless/ath/ath11k/dp_rx.c | 88 =
++++++++++++++++++++++---
>> drivers/net/wireless/ath/ath11k/hal.c   | 14 ++++
>> drivers/net/wireless/ath/ath11k/hal.h   |  2 +
>=20
> My Qualcomm Innovation Center copyright checker reports:
> drivers/net/wireless/ath/ath11k/dp_rx.c copyright missing 2024
> drivers/net/wireless/ath/ath11k/hal.c copyright missing 2024
>=20


