Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0257C4167D
	for <ath11k@archiver.kernel.org>; Wed,  8 Nov 2023 14:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VdHR/X+oU4lkuCd1uttmUNr5MzqavZb+B8uIkEL9c04=; b=rDM+UKtv40eEvuTRg1ElIqy19S
	2plDZJF/0lFTcpVjoiZEuXcp13UgO4nvbCZ96oX9idyhdO37vPYJc2hdzoB9HCsIEDKkY8cg5E5+0
	L5ThqUNgpx9H1s6YKWJdDqUwJx6C3KEZSutE8erJYfa/RW60mcR9iFTr/22LQFBgSJ0n1J9VVMMgF
	kmVXFTgWm7IgjNH6FLH0D0Uver6ygbXVWA/UKQBj+hbfP3CQYd0oZTvIOa2t7Mc8zA4zsbot4lie9
	m9AhDaX7xIEtlQ2FxDJTRE4bfj39aK17QhBqTMDpcfQSbIQMvy+DxnEtimwfQBN+qOe/ThfLAJCve
	L2360lSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0jiH-0042c3-0t;
	Wed, 08 Nov 2023 14:39:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0jiE-0042b9-26
	for ath11k@lists.infradead.org;
	Wed, 08 Nov 2023 14:39:24 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A8E2ddA015496;
	Wed, 8 Nov 2023 14:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=dv/Z9G6ZAr9+lMxiIaSYC1sphG27a5cZSvv4iXRKE4E=;
 b=VSi+0vhHhqkroGtIAQtYVqxDjxxDmSMhworfrSpTdIjGIddR3ewKbXcn4bPPSwKUOI+M
 PujqA8FLYosifRbed2QMDT91KXfaooS3H65LXXq7phi13SPNnvCfO/qDm7nD7CflxRjH
 dXjnedg56zHVARxqncDsXryQeZGhVzE+ZvNdR1dNAn2DVUA5Ha4XqP08vgdxuiG2hAqL
 BeXXfz/oxhyIn/USkuj4LbKFm4KN7DepEu1G6dXu3/IqBOwsyVudLay8fvoqK8059Vzl
 dyoOU9HGBHsS2w9dCgZmfUdkpG5K038Zr4KDT39nyAJGeBzmcJEPrMc/gzck/mUwV6nV kg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u7w2c1vvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Nov 2023 14:39:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A8EdFaX013459
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Nov 2023 14:39:15 GMT
Received: from [10.110.1.228] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 8 Nov
 2023 06:39:14 -0800
Message-ID: <b2a44dc4-f5ec-46fe-a4ce-a2151ac65aa3@quicinc.com>
Date: Wed, 8 Nov 2023 06:39:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Can ath11k automatically enable CRYPTO_MICHAEL_MIC?
Content-Language: en-US
To: James Prestwood <prestwoj@gmail.com>, <linux-wireless@vger.kernel.org>,
        "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
References: <c558e244-b10d-43f3-9f42-f6c2f98d5b95@gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <c558e244-b10d-43f3-9f42-f6c2f98d5b95@gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: K52qDjw9qRCO-05013gYInzWHpQXaLlV
X-Proofpoint-ORIG-GUID: K52qDjw9qRCO-05013gYInzWHpQXaLlV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-08_03,2023-11-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=703
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311080121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_063922_696454_92643CF5 
X-CRM114-Status: GOOD (  15.91  )
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

On 11/8/2023 6:33 AM, James Prestwood wrote:
> Hi,
> 
> I'm not very familiar with how the Kconfig stuff works, but I spent 
> longer than I care to admit trying to get the ath11k support to show up 
> in menuconfig.
> 
> The issue was CONFIG_CRYPT_MICHAEL_MIC was not set, which removed the 
> ath11k driver from menuconfig because of:
> 
> depends on CRYPTO_MICHAEL_MIC
> 
> Maybe there was a good reason (again, I don't know much about Kconfig), 
> but should/could this use "select" to automatically enable 
> CRYPTO_MICHAEL_MIC?
> 
> Thanks,
> James

+ ath11k list to see if there is any history on this topic

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
