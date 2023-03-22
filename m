Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A55C6FD1C
	for <ath11k@archiver.kernel.org>; Wed, 22 Mar 2023 05:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2+UGEh/admAgzNJ9EvcNKAcu1IxYoSUZwYfCpJi3ztg=; b=0grdsoN8xd/04z
	fzgdaUAPzV0zCiozeqOUdBfXGL+7Zy0TsXyinoZXd20Qw0da1AiajOqbA/njYxmrb6+2KkwAXoFBr
	KWfm2JNMyv5dpdMeHVLK64gLOt3VWT3i41n/+2qv2MySdRMA6ImLrU+P7AtPc4KK819d5+Ax1+qkr
	vc9b2rMe8taFic2TPmwJcy4qurj2UZ+K0ontwzPYZozCtD/suOAbjnrn6DR2JyrFOPzor5Ww0EtGA
	v96QaYiedSUfpWSq8/+B8XoVEfKsaTD9hfv+pU1AXVUswHyQ1/a8dRaFXVn2j1x2DT8ylruPERKx1
	+qgFjGRrqb/c7e7UlqeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1perQc-00EmSM-1r;
	Wed, 22 Mar 2023 05:54:30 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1perQY-00EmRJ-1U;
	Wed, 22 Mar 2023 05:54:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 37897B81A06;
	Wed, 22 Mar 2023 05:54:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B91C6C433EF;
	Wed, 22 Mar 2023 05:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679464463;
	bh=EyLO3+rjpwsdiQ0zKsxaRFcvLsqBi1X3BezQ0mQ/27A=;
	h=From:To:List-Id:Cc:Subject:References:Date:In-Reply-To:From;
	b=Iy/4VQZiWkYHykhhczLmGXKjaFYY11F1Y/naaU9L8UxOg6AbLOimUWUELgFe2wOJP
	 skStkOvZsNGqyrchuUMBFm8X2QfixrN5ClK0/PB05rdEDSywBx5fHxzYnAadEQT3eS
	 3ynZqExhAEXGO2jArDiduW4x7LYRw1O1zBLN3B3AFwL2ssdQKaRM8yG/K9hcE7zxu7
	 v5QL6Dh7OW89GbTy0qTtz4f5c2hgkjmAj4xJ5eAe2p5rBStahgZVFgF7B84Dcy+Nig
	 DSYIx1BrYZSfkOxeJ9cTmh+FDGJpwDuN88loOKdxIWz+S9uQdC8LpnCVjdEIy9wFUt
	 zpE+n2BqXHYaA==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-firmware@kernel.org,  linux-wireless@vger.kernel.org,  ath10k@lists.infradead.org,  ath11k@lists.infradead.org
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20230215
References: <878rgzuw37.fsf@kernel.org>
	<f08d7310-8c33-ab0b-c9f1-317f737ba37c@linaro.org>
Date: Wed, 22 Mar 2023 07:54:19 +0200
In-Reply-To: <f08d7310-8c33-ab0b-c9f1-317f737ba37c@linaro.org> (Dmitry
	Baryshkov's message of "Wed, 22 Mar 2023 01:39:17 +0200")
Message-ID: <87v8ite3g4.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_225426_789433_61BE26BE 
X-CRM114-Status: GOOD (  15.10  )
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

>>   ath11k/IPQ5018/hw1.0/Notice.txt          | 4094 ++++++++++++++++++++++++++++++
>>   ath11k/IPQ5018/hw1.0/board-2.bin         |  Bin 0 -> 524564 bytes
>>   ath11k/IPQ5018/hw1.0/m3_fw.b00           |  Bin 0 -> 148 bytes
>>   ath11k/IPQ5018/hw1.0/m3_fw.b01           |  Bin 0 -> 136 bytes
>>   ath11k/IPQ5018/hw1.0/m3_fw.b02           |  Bin 0 -> 262144 bytes
>>   ath11k/IPQ5018/hw1.0/m3_fw.flist         |    3 +
>>   ath11k/IPQ5018/hw1.0/m3_fw.mdt           |  Bin 0 -> 284 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.b00           |  Bin 0 -> 532 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.b01           |  Bin 0 -> 520 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.b02           |  Bin 0 -> 7552 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.b03           |  Bin 0 -> 545008 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.b04           |  Bin 0 -> 86788 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.b05           |  Bin 0 -> 17776 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.b07           |  Bin 0 -> 1488 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.b08           |  Bin 0 -> 4096 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.b09           |  Bin 0 -> 2330624 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.b10           |  Bin 0 -> 269028 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.b11           |  Bin 0 -> 99436 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.b13           |  Bin 0 -> 7024 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.b14           |  Bin 0 -> 1668 bytes
>>   ath11k/IPQ5018/hw1.0/q6_fw.flist         |   13 +
>>   ath11k/IPQ5018/hw1.0/q6_fw.mdt           |  Bin 0 -> 1052 bytes
>
> For the past several years, the Qualcomm community has been shifting
> from the pack of .mdt+.bNN files to a single .mbn file as a main
> firmware file format. It reduces the back-and-forth between the kernel
> and userspace and also simplifies handling of these files.
>
> In-kernel mdt loader provides backwards compatibility, detecting the
> file type and using .mbn instead of .mdt one, retaining the name (or
> using symlink).
>
> Do you have any plans to also shift from .mdt to .mbn?

I have not heard any such plans but I'll ask around. Would you mind
filing this to bugzilla as a feature request?

https://wireless.wiki.kernel.org/en/users/drivers/ath11k/bugreport

That way it's easier for me to track it.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
