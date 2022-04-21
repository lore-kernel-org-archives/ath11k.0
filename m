Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D334FC433F5
	for <ath11k@archiver.kernel.org>; Thu, 21 Apr 2022 15:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6XflfbbBJzBeIhaTymVGkXNKzAkFA9CG7kMya0Ik2Ow=; b=a3qXLzxwF+52sh
	/i0YKJNvWnGIS+aRoNIcQXbXhArQUZOUUDZY6waKmJsyxyOJFT522jTEjb66PbGhBHGcbXfm3BSv4
	6OpQf/0TEArhMCJLMrn4aQBC/TJq7H2/d7gReOZDVr46t0BRAClK4hP4baQF11/2FPirIgh3eD2Wa
	wazr64eXPHS5+gq82C1yIg3UjIP9HGiPOXulH3yImMGSB8Yo5m5nO0hmOlsRe0NCZP5wmFNhRIbsu
	AAMB1VIYgF7NKuNW9qdhHPWnE52i6c3sJLA8TTnypNfoKXGqMdevM10ziJMDDwUClmVID4z9wmszH
	TUUERPgyX1vgD+dOCu7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhYMb-00DwWO-Td; Thu, 21 Apr 2022 15:04:57 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhYMa-00DwVa-62
 for ath11k@lists.infradead.org; Thu, 21 Apr 2022 15:04:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650553496; x=1682089496;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mQKp/jMr3FcKjmXxKJnYzdG6TMr0zWV7HaL0JZGzmi0=;
 b=ejtEEqanVNuRPJUq/PRQ1iF6TZj9lm4CtCfcK1zFeeo49RgEyLxVG/nG
 23v4DLl7qPRMsHZd+FM9XuzCXCKWXofoXPvh+O/9KNDB4NPH+NMdqnO7u
 jwnRJsbfOascvgR72e1sdIS8r4qhwl3ITjXLgEHW5WF6nHKSeyqLIwDAL 4=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 21 Apr 2022 08:04:54 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 08:04:53 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 21 Apr 2022 08:04:53 -0700
Received: from [10.110.114.17] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 21 Apr
 2022 08:04:53 -0700
Message-ID: <6306770e-586f-54dc-c12c-3e3caa8679be@quicinc.com>
Date: Thu, 21 Apr 2022 08:04:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 1/2] ath11k: add support for extended wmi service bit
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>
References: <20220401120948.1312956-1-quic_bqiang@quicinc.com>
 <20220401120948.1312956-2-quic_bqiang@quicinc.com>
 <4f421eab-1ace-51c6-e677-42b32b6afc56@quicinc.com>
 <87h76nogqt.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <87h76nogqt.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_080456_300319_A54DB05B 
X-CRM114-Status: UNSURE (   4.54  )
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

On 4/20/2022 9:35 AM, Kalle Valo wrote:
>> I suspect Kalle can just apply these comments to his pending branch.
> 
> Did that now, please check:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=d98a4c9bd0b32824ad9ee2d24ecabb345edfaafe
> 

LGTM!

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
