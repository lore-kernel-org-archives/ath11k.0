Return-Path: <SRS0=CfPQ=JX=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21EFCC433B4
	for <ath11k@archiver.kernel.org>; Mon, 26 Apr 2021 12:52:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 567E861263
	for <ath11k@archiver.kernel.org>; Mon, 26 Apr 2021 12:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 567E861263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=claudio.csita.unige.it
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NxbUHXoG+5bF5jWuMKIKjTEdM+uuKujaHIIlfwPRZ/o=; b=qIFU6fkYd3Phix
	ahzI0Ar+6Yyfxml7qXaRI0yYdEmbFWM8k2Azx4HbIvbJobVdJQnE/dFeygQHq2l5tMiUwzK9hUrvk
	IM82RL4lN1DSxF0x2HQ8SqGW1RXNYKhe76vaj0Hev8n13O5npTSFgU4bggyOiBXx55+oVwTwunBUH
	ljSbbuAZLDW6F0FB1DE+oXyWBo2cGIwbY1A+fL4813FM9R3zHv4uuvDKMkaCpv5fuIlX8S+7uKSd2
	qwEt/EtRtpkOVa8mOgQ/EVShYTex9bkhYmhulTBhkbqpkjJflDkXTyZLvzQYDZ609efWgxBcYPBS5
	gpVbK2Qkzms3OHz5oyyQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lb0ia-007eUF-9r; Mon, 26 Apr 2021 12:52:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb0iY-007eU5-9O
 for ath11k@desiato.infradead.org; Mon, 26 Apr 2021 12:52:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=ogE8jfbNKDpVDBNgnUd+T627Vusus9C8TDJaNQQde1o=; b=zMyngAOMpDbMnHRpSgGgv4jzQD
 4ZPaF1q1stobWb4CuAHSBOzvHH2DYGXe+jLucWnPB3Mc7tAcFib+RB+ibFPnasBvlHWek5ilFzLzv
 yJ+v5sqjYxPYPoag4Mf+hCi/9hKyAG2hOrFNw87etvIvq3kNSExc23zcDFVY7IS/2pEQWxV8r6ayz
 JN3dvP7ZWu6u+/vt6sTGr2Ulzi0J91fwTuiMpDcbziqu1ehbO42Jd208bMWV+/joEhKkTQqa2WUp+
 SAs0WfoMi6acynZrJ0NAZe1gRlDcHUp2COy++vAqGkFFcAzXSgJF2FdOVmNMTiB0eN33n9cpNSSIT
 O1jmg99Q==;
Received: from claudio.csita.unige.it ([130.251.21.56])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb0iU-00Fy4j-Uf
 for ath11k@lists.infradead.org; Mon, 26 Apr 2021 12:52:00 +0000
Received: from [192.168.1.66] (2-238-95-24.ip243.fastwebnet.it [2.238.95.24])
 (authenticated bits=0)
 by claudio.csita.unige.it (8.12.11/8.12.11) with ESMTP id 13QDIUWk017502
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO)
 for <ath11k@lists.infradead.org>; Mon, 26 Apr 2021 15:18:32 +0200 (CEST)
 (envelope-from claudio@claudio.csita.unige.it)
To: ath11k@lists.infradead.org
From: Claudio Di Martino <claudio@claudio.csita.unige.it>
Subject: p2p modes support
Message-ID: <538497e0-7d75-e233-775c-057cc6689e3f@claudio.csita.unige.it>
Date: Mon, 26 Apr 2021 14:51:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Language: en-GB
X-Virus-Scanned: by amavisd-new
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_055159_353549_CAD6CD4D 
X-CRM114-Status: GOOD (  10.20  )
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

Hi all,

I write to know if support for p2p modes is planned for the ath11k driver.

I see that the ath9k does, the ath10k not.

I don't know if the difference is inherent to the adapters, if there are 
difficulties in implementing such modes on the supported hardware or 
simply it is low in development priorities...

If I can help in any way please let me know, I have some programming 
skills but no kernel drivers experience apart for some minor code 
tweaking / bug fixing on freebsd several years ago.

Surely I can provide some early alpha/beta testing and bug reporting if 
it's needed.


Thank you for your work, I'm looking forward for any info about the subject.


Regards,

Claudio


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
