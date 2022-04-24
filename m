Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9BCC433EF
	for <ath11k@archiver.kernel.org>; Sun, 24 Apr 2022 12:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=71Q79HnTBQtXrB/6Uuf4Jvyq6Ty6B0pbMrWxDt1F8PI=; b=XVJiu6EX0Exs9+
	mBQ9hUIZ1vsEtCZGIrQWsmFe7kOPyt/ykdIb1VawAyn3JDFWN3CYO9pKFDf4N1wS7Sm8K+bZ/cSeK
	ZlrRioYoxLx9hFexQcKE52xxdC5kqtb5PDy1nBFn21QKlvABCzJHk+DycON+d18NkfZgu85seryn3
	vwk+YdIdo0dWPY4P6Evnsl4gqPd7a9ouBgEUrALQQZdXlvCTWp+zh5BNWpeWawIfASK1/dHxtBk8K
	vHvhHSThkAuEabRr3iS5X/jmyS0w9fHqBGgWYHQpWiTVJHgKFpdwpHF5lIurzSkIsDlwFBRySVnHE
	z/t2NL2obghI2VCHMrkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nib6Y-006Y6Q-J6; Sun, 24 Apr 2022 12:12:42 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nib6V-006Y65-3W
 for ath11k@lists.infradead.org; Sun, 24 Apr 2022 12:12:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650802359; x=1682338359;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dMNiOiLzChr/7IMjjJyhXX+Ew+uWRVB1fgb0yHCKV3Y=;
 b=ZpM6TG3+PBSkIxudKQJMFaVU+4uQcTZOj/hSQR2LQ8WhzPCe2gv915bn
 vhlJEqUNUw4G/84cDp5emYKVhJgxIXji0FNrFeKUAtsARCBWj/Z8v9XN2
 G3JFCMJFIZJ7tf2gdb/SBXTWtT/oKMJF13QoEnn9TEQtw8BdlyQwWFy1m Q=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 24 Apr 2022 05:11:36 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2022 05:11:36 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 24 Apr 2022 05:11:35 -0700
Received: from [10.253.33.23] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Sun, 24 Apr
 2022 05:11:34 -0700
Message-ID: <a97692be-d1a6-266d-6876-3716923aceb0@quicinc.com>
Date: Sun, 24 Apr 2022 20:11:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] ath11k: add read country code from SMBIOS for
 WCN6855/QCA6390
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20220421023501.32167-1-quic_wgong@quicinc.com>
 <8735i4m8hu.fsf@kernel.org>
 <61d2a5aa-c82d-6994-a8f3-0d31e32421be@quicinc.com>
 <87o80qkcau.fsf@kernel.org>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <87o80qkcau.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_051239_224322_4891B6A0 
X-CRM114-Status: UNSURE (   5.21  )
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

On 4/24/2022 6:26 PM, Kalle Valo wrote:
> Wen Gong <quic_wgong@quicinc.com> writes:
>
>> On 4/23/2022 5:53 PM, Kalle Valo wrote:
>>> Wen Gong <quic_wgong@quicinc.com> writes:
>>>
>>>
>> ...
...
>> Yes, Kalle,
>>
>> I agree with you.
>>
>> need I send new version to change the "__le16 cc_code" to "u16 cc_code"?
> I fixed this in the pending branch, compile tested only. Please check:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=a6d583e310c70fb93ec7045f0ea38c12632098d8
yes, it is OK after check.
>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
