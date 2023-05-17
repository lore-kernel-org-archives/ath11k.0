Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A798DC77B7A
	for <ath11k@archiver.kernel.org>; Wed, 17 May 2023 13:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=66O4qwJeMHIodLJPO/X0TpIPhoFbYu209+cBLj5Mfa4=; b=A83VpNUNc9AYiO
	fpb8fvpo6cOui4LVigfqavZ039zdo2P0eths8o2+6dw8OtW41tU2C5wYnb24duH8sxYWaPkOLn+gQ
	DEc45hY3ACjQV0cYmIGJn46Vt9wTAW+L29ukj8nGIJ7LZR6maxVXOaEqKcG9TEmjQnoCX7rOdfid6
	AsIszpIpQtYB8nKFrR5McGkslmXkq/sanZ46PfiDU6R7DUjCK2Y6YqQHy/EIs8ymzLdOxxRFoQ8Ie
	DaFqXqu5qjsD3pCXsP5j0/8R/LvPvOoM7HTxGp/861/Qg4QbPZLsUEibYcP6tC+qE2mAuN2byjUWQ
	bmucFxJ2x+ASbeNP43Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzHh4-00A3dB-15;
	Wed, 17 May 2023 13:59:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzHh1-00A3bU-2C
	for ath11k@lists.infradead.org;
	Wed, 17 May 2023 13:59:53 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34H95XoT008242;
	Wed, 17 May 2023 13:59:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=5GyuLDnwVsozuR8eAsgE2Ab7PK+ksn54/ioU486uZVQ=;
 b=U/FXRKU32PJyIxhHJGoZNlM6SX2j3eB1LtAATcru+YatbWeyuBfUPlZG/pP1cRSYpe1+
 sxOV3JEFRpwSWw6ZRs0N4THHWAb1P84Zd2I4xEzBE8PzmAqhyBw8X6UgerXmCNsaMOSt
 V7HHrvJcZSRZsw2pkYRuEBkXWKPPCtZsTeMujg5esJb9rMyDXT1svY3LaktDO060qxoS
 gVl+0a6RQTZ4gCH8XMXAjQ6YQuzoIkISRLFKFdE6zRLBx69yTRSwihjkTAaoyaUVQRWj
 6bAZE1/yMTljLxq3iCRmm2pIqcYnPOuFkYK5BRE+k3OGKgwaHZFjowk53IjwFOztnggq Sg== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qme0ma78d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 May 2023 13:59:41 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34HDxeiB002901
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 May 2023 13:59:40 GMT
Received: from [10.201.164.214] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 17 May
 2023 06:59:38 -0700
Message-ID: <351be742-6b4d-c9fd-5583-2a8b2b296d98@quicinc.com>
Date: Wed, 17 May 2023 19:29:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] wifi: ath11k: Add rx histogram stats
To: Ben Greear <greearb@candelatech.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Manikanta Pubbisetty
	<quic_mpubbise@quicinc.com>,
        Abinaya Kalaiselvan <quic_akalaise@quicinc.com>
References: <20230405132804.226681-1-quic_mkenna@quicinc.com>
 <1e0de6cd-4e43-273f-2222-1c52d2b6d95e@candelatech.com>
Content-Language: en-US
From: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>
In-Reply-To: <1e0de6cd-4e43-273f-2222-1c52d2b6d95e@candelatech.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gSCAhwQhmW5wRa0eVElYx-yd4tdNXt5P
X-Proofpoint-ORIG-GUID: gSCAhwQhmW5wRa0eVElYx-yd4tdNXt5P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_02,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 adultscore=0 mlxlogscore=740 mlxscore=0 lowpriorityscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305170114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_065951_725378_C95C9D8D 
X-CRM114-Status: GOOD (  14.26  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Ck9uIDQvNS8yMDIzIDc6MDUgUE0sIEJlbiBHcmVlYXIgd3JvdGU6Cj4gT24gNC81LzIzIDY6Mjgg
QU0sIE1haGFyYWphIEtlbm5hZHlyYWphbiB3cm90ZToKPj4gQWRkIHBlZXIgc3BlY2lmaWMgZGVi
dWdmcyBzdXBwb3J0IHRvIHN0b3JlIGFuZAo+PiBkaXNwbGF5IHBlZXIgcnggc3RhdHMgaW5mbyBs
aWtlIEhFLCBWSFQsIEhULAo+PiBsZWdhY3kgYW5kIE5TUy4KPj4gQWxzbywgYWRkIGEgZGVidWdm
cyBrbm9iIHRvIHJlc2V0IHJ4IHN0YXRzCj4+IHNwZWNpZmljIHRvIHRoZSBwZWVyLgo+Pgo+PiBU
aGlzIGhlbHBzwqAgdG8gZGVidWcgdGhlIHRocm91Z2hwdXQgcmVsYXRlZAo+PiBpc3N1ZXMgaW4g
dGhlIFVMIHRyYWZmaWMoU1RBIHRvIEFQKSBieSBnZXR0aW5nCj4+IHRoZSBzZWdyZWdhdGVkIHJ4
X3N0YXRzIGluZm8gbGlrZSBIRSwgVkhULCBIVCBldGMsLgo+Pgo+PiBUaGVyZSBpcyBubyBhZGRp
dGlvbiBvZiBuZXcgZGVidWdmc19maWxlIGhlcmUgdG8gZ2V0Cj4+IHRoZXNlIHNlZ3JlZ2F0ZWQg
c3RhdHMuIFRoZSBleGlzaW5nIHJ4X3N0YXRzIGlzIGVuaGFuY2VkCj4+IHRvIGdldCB0aGVzZSBz
dGF0cy4KPgo+IEknbSBhIGJpZyBmYW4gb2Ygc3RhdHMsIHNvIG5pY2UgdG8gc2VlIHlvdSBhZGRp
bmcgdGhpcy4KPgo+IEknZCBhbHNvIHN1Z2dlc3QgYWRkaW5nIGhpc3RvZ3JhbSBmb3IgYW1wZHUg
bGVuZ3RoIGlmIHlvdSBjYW4sCj4gYXMgYSBzdGEgc2VuZGluZyBzZXJpZXMgb2YgMiBmcmFtZXMg
aW4gYW1wZHUgdnMgc3RhIHNlbmRpbmcgYSBzZXJpZXMKPiBvZiA2NCBmcmFtZXMgaW4gYW1wZHUg
d2lsbCBnZXQgc2lnbmlmaWNhbnRseSBkaWZmZXJlbnQgdGhyb3VnaHB1dC4KPgo+IFRoYW5rcywK
PiBCZW4KPgpIaSBCZW4sCgpUaGFua3MgZm9yIHlvdXIgZmVlZGJhY2sgYW5kIHdlIHRha2UgeW91
ciByZXF1ZXN0LgoKV2Ugd2lsbCBzZW5kIHRoZSBwYXRjaCBsYXRlciBvbiB5b3VyIHJlcXVpcmVt
ZW50LgoKClJlZ2FyZHMsCgpNYWhhcmFqYQoKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDEx
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vYXRoMTFrCg==
