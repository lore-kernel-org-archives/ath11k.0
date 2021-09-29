Return-Path: <SRS0=zO0o=OT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 796F1C433EF
	for <ath11k@archiver.kernel.org>; Wed, 29 Sep 2021 02:16:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E568611C7
	for <ath11k@archiver.kernel.org>; Wed, 29 Sep 2021 02:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E568611C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uh2fvEMpUJbB19hM4LVMKUz6t8jU0bu2GmoN3SfJ8MY=; b=MJ28UuVbjINIW/KfDiwCPo5OqT
	tZaNTYXeEtzd9X7/pIiEuz6rQM4TFPHQI1qNpuqv76O64Rxog3Qhy3t0Hf0XfE6i6EYeBmQi2jrqu
	oOlOKirjcmpGcUKKaF6MY3WtmJ4x7a8TslmGCX5Eh372UIwU70F6TvOSUNcFXRyCXgfpApYAOCYyb
	i74x+fIxvKXyIh7w9sFTG/5wnPT7dAJU+t8md6kt/2GbcNElVrsbhLh11LUz7itWMC/K73F5i1pe2
	XKjTa1rVeeU8hlIzwPj705hValYg7rSyL679ETE7ATmxdpIEZim25TcH9nNxKtKx6Ll9/l3aatQEH
	rF9g53dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVP96-009h32-PK; Wed, 29 Sep 2021 02:16:32 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVP8z-009h2P-24
 for ath11k@lists.infradead.org; Wed, 29 Sep 2021 02:16:31 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632881789; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=uaZB9ra4UVxF/ZwJklZQnctArUGuAc5SX7fYtLAImXE=;
 b=ItlNeBi/+lY20z9Dth2tQPNpa+PQhiQ573+Kov37ft36LyZUo9UfP/EMrcn4Lcr7JlhZwuXC
 YyLH8I3RNZhJaJLXGda5Atgw3OSuaFJrgVX41CStmlTxRvOuB8H3oLjLlH296Bgru27z41Iq
 v5P7WW5LLkA+KcngQtWSlsqKkY8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6153cc53713d5d6f965918b8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 29 Sep 2021 02:15:47
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 11D6EC43460; Wed, 29 Sep 2021 02:15:47 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: bqiang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7FBC1C4338F;
 Wed, 29 Sep 2021 02:15:45 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 29 Sep 2021 10:15:45 +0800
From: bqiang@codeaurora.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Jouni Malinen <jouni@codeaurora.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
Subject: Re: [PATCH 1/3] ath11k: Change number of TCL rings to one for QCA6390
In-Reply-To: <87tui4pwdz.fsf@codeaurora.org>
References: <20210914163726.38604-1-jouni@codeaurora.org>
 <87tui4pwdz.fsf@codeaurora.org>
Message-ID: <42fa097a799050100b6978ef0ab4e8b8@codeaurora.org>
X-Sender: bqiang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_191630_063413_A0D90D68 
X-CRM114-Status: GOOD (  11.19  )
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

On 2021-09-28 23:12, Kalle Valo wrote:
> Jouni Malinen <jouni@codeaurora.org> writes:
> 
>> From: Baochen Qiang <bqiang@codeaurora.org>
>> 
>> Some targets, QCA6390 for example, use only one TCL ring,
>> it is better to initialize only one ring and leave others
>> untouched for such targets.
>> 
>> Tested-on: QCA6390 hw2.0 PCI 
>> WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
>> 
>> Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
>> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> 
> It's better? Please be more specific. Does this fix a bug or is this
> just a theoretical fix you found during code review?

Yes, this is just a theoretical fix. By "better" I mean there is no need 
to initialize
the other two TCL rings for QCA6390 since they are not used.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
