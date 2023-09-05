Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26459CA0FE2
	for <ath11k@archiver.kernel.org>; Tue,  5 Sep 2023 16:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:From:To
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KCYy8OFtouEx2okFdHcyjLoiclFGTXcEgk62sIRuvbk=; b=UMv87vEbN+QVs2
	d0Mz+VnhVPyqpyqAN/ZFYiGEE4RU+YM1LcItJUi8yvEdiMrvX8UJiJg4p/b26xfJNewyqJhbmm54y
	SvpciDGJBqdN9cOV4yhvgM9mqwGzqG7UpPKLgmz5ENcwCnIceyN+qelC+hX5a50UNwhxSw13SJMWS
	AWfzj1/GC6Jl03ccayiV14JSNlsnNSC5cJVNI0kvVnWYjvo7mHiIdcx0Erh9L2wnc1/abwBM62rNk
	67iUtjvtI0/URTUxe319UsDrelWp+/DE0hUndLDHix01vNgqtxMnEmEJ6KZcbynpmJmJW6gWmlKK9
	FDLE+w91E+0zEa0ELtMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdYcU-006Jze-1j;
	Tue, 05 Sep 2023 16:09:38 +0000
Received: from mail-4323.proton.ch ([185.70.43.23])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdYcR-006Jxx-1M
	for ath11k@lists.infradead.org;
	Tue, 05 Sep 2023 16:09:36 +0000
Date: Tue, 05 Sep 2023 16:09:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ironrobin.net;
	s=protonmail2; t=1693930172; x=1694189372;
	bh=xDOFQT8Y3iraoQ74ya/n+sS/5S7Fuczyh9fpLTKeiR4=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Dl/na3wTLFsl0B43/o6eZ/Us+kOwqIdMxCQ+y8tFMQJiTgf4EnwkZWqEuw8mIRpDL
	 BZlUG7zt1dSSAzzPEPC2O89Nz292qp112GUZ1LxrKcq8f6/WnShnH0FxKz/ezFJKpa
	 ZHf/47fG0nwZ4lTAkSie0gnAD970M/Q0SNA82hzWJyG674RM9zUXG4rzwM2dCmDnov
	 iKWQ66ayNZALJrlJLuIXZTCKMN8LWupQ4TkFzOYHniXmqFLfVZ82Scmt93LO30Ux7C
	 UldcDQ76Ai5XblJkdMlDvsG4Rr7IGW40D8/a/IaFvYlTjxi0/puO2xTgipl5xg/t8d
	 Pu5aMqxg3dQZw==
To: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
From: Alex R <alex@ironrobin.net>
Subject: WCN6855: Request: Support ThinkPad X13s 21BY-S03Y00
Message-ID: <mYl9fKKm9_Kn1aqjsnk6yx9YxhhFShCQeF2qptjjWlKDJ-XpxsO038Eag4A9S4EABiWbhiJ8polAtrOwVGIZeZ1yYTSwNYldBBDeZXMmtxI=@ironrobin.net>
Feedback-ID: 54785507:user:proton
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_090935_613412_61982512 
X-CRM114-Status: UNSURE (   1.84  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Trying the latest board-2.bin from https://github.com/kvalo/ath11k-firmware/tree/master/WCN6855 and my wlan0 fails to come up. dmesg: https://pastebin.com/CWHpD0kC

My other X13s system (21BX-0015US) works fine so I am wondering if my new X13s (21BY-S03Y00) product type is unsupported.

Alex

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
