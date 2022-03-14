Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242CCC433F5
	for <ath11k@archiver.kernel.org>; Mon, 14 Mar 2022 10:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=culpduV/wTItLUqScmyTqoQWRkRnkRmLGX6zyGEPZ+Q=; b=NG3wxxvvVV5lAc
	B4PuphViWowhLzvy+fM38GG6jAK5axZkaqumWNfTAn2Fi8E80sY7YfAKkfBZcRF2NtFie4s+P3URz
	1QnZ9Vb3Au3WF5DZoEgEJhmwmo+Kma3puyhbP0gnK+VPQ390K74n7RkTpZfIq1kA4x4aNcuNXvh3j
	OzZrSAKHETGYbQYKzRA84KC8V14Cr1mIjOdY1utPEtbogIrbpJ8YLEPkVikqRo9fIWBM0gZv1JNxX
	D8EXbT40oVtwXDwYLEqHzKP1LvbrRD8bSKihbt/0JR/3SHLz2cUfyjmhK2ha0tjQx7Zt8UXNZRUQL
	RQdWZeWLSDhfHJ1+yOSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTi3F-004zdn-C7; Mon, 14 Mar 2022 10:35:45 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTi3C-004zcS-Ei
 for ath11k@lists.infradead.org; Mon, 14 Mar 2022 10:35:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647254142; x=1678790142;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yrAhA7rZrfkRkH2MZvw5SyfcOkFW8WQs/9q3Un5jU44=;
 b=mNIdlSEtR5hl8zkHDtiVB/lKzTkGXKHj/I415yBbejMaJZevzyfDdQYd
 Xm1+q2cvhaE7rcExgOYJqPf/orqn6kcFm+9HQ/sBktAYRRnxnMtk8l0Kh
 y658X/qWtVmohViSqwcXnlLGWkJ/4VmpLFwv5q46THrd5fKbQX6AJnan7 M=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 14 Mar 2022 03:35:40 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 03:35:39 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 14 Mar 2022 03:35:39 -0700
Received: from [10.253.10.5] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Mon, 14 Mar
 2022 03:35:37 -0700
Message-ID: <b545dace-7dd2-3d40-0171-a85f90e606b9@quicinc.com>
Date: Mon, 14 Mar 2022 18:35:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 1/2] ath11k: add fallback board name without variant
 while searching board-2.bin
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20211220064829.17557-1-quic_wgong@quicinc.com>
 <20211220064829.17557-2-quic_wgong@quicinc.com> <871qzas0dw.fsf@kernel.org>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <871qzas0dw.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_033542_558366_1CC0923A 
X-CRM114-Status: GOOD (  16.21  )
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

On 3/10/2022 4:00 PM, Kalle Valo wrote:
> Wen Gong <quic_wgong@quicinc.com> writes:
>
>
...
>> @@ -722,7 +734,7 @@ static int ath11k_core_fetch_board_data_api_n(struct ath11k_base *ab,
>>   
>>   out:
>>   	if (!bd->data || !bd->len) {
>> -		ath11k_err(ab,
>> +		ath11k_dbg(ab, ATH11K_DBG_BOOT,
>>   			   "failed to fetch board data for %s from %s\n",
>>   			   boardname, filepath);
>>   		ret = -ENODATA;
> This error message was useful as it made easy to find out what board
> data file we are missing. An example:
>
> https://bugzilla.kernel.org/show_bug.cgi?id=215586#c0
>
> So I'm worried it will become more difficult if the message is changed
> to a debug message. But I don't know what's a good solution either, we
> shouldn't print an error message while we are searching for the board
> file and print it only after we could not find any. One idea I have was
> to print every boardname we tried to find or just print the first
> boardname, but don't know really what's the best.
>
> But to summarise, we need to think carefully how to handle the missing
> board file case. It's very common for users that a board file is missing
> in board-2.bin so the error message should be informative enough.

Yes,

I think we can change to print the error message after we could not find 
any, I will change it in next version patch.


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
