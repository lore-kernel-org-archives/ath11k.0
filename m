Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27ADCC04A95
	for <ath11k@archiver.kernel.org>; Wed, 28 Sep 2022 15:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fE00kDYSId/iY8qJ0ZvC4MciAvDaTKnyiFhHlV3MYVk=; b=vJm/nDjwQ43FUb
	PmD/Pt9VgO4KcqXwUrISCpAUHz3FbNtsVLVZwKxHeo7gvZcu6/EGEy0Abr+4fFFBcWBchmp7EAEdy
	zvqv5aD3nyHwyQDW3jmfbCOrdjl5XiJbWt4IC5gIr69ngzLZzFKninRrioBESnwXp6cGTnvtNTtjl
	3V4cOwUhC/1kqGTj0D+4YKnSVFA6wzgKQKqLrSkOqcrc24URfpnM0TICOUR5lhZt5eXsMDHmMjh7l
	Fhxs5OPYbUgTHoI9dHzzH3moq1Ozt1jH74GiijLsvY+ow/3ofEqpHi73MP5tfP3Xs3bNkK8rkNpau
	sjDbF7AQ9k5kO9UamDYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odYmw-00GrIY-KX; Wed, 28 Sep 2022 15:15:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odYmp-00GrG6-B4
	for ath11k@lists.infradead.org; Wed, 28 Sep 2022 15:15:48 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28SE2tHr032230;
	Wed, 28 Sep 2022 15:15:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=BhlGNW953+5Y219pY2aK+nsabIJDn+S+PDNng0R+ELE=;
 b=GooLvqLnLhXqVYg7emDkipwybfzRQNLPkZotXuHk3pOvWpkf2ffspEZu7ofV/Si1dOJz
 tS4TjzAgyl7YivUqUE9db4dFPmoj1kjBNqkT8pv+ReGGSmqFPZcxYF0rFqp43cCVhtZf
 EN358yQ5NzBtwrRAmU0h/wvTPLVnux+jZ1+Yw6AN2k6zd5skoQLswibn4vcxxujYqEsq
 ubL3f4HVM8SEgH7hgmfY8+AIz7h9/9draShLyAoRAr0bOKjB0U9U9F3Jpc4/hwSD+CKn
 HzlctN7RK3MPd+jPqMCf9EVSNDfNkIm2W+w6+xbvkrk2SouNDsAHC+cKXkU09hR78k0V 3A== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jvpuv8ene-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 15:15:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28SFFkxA015582
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 15:15:46 GMT
Received: from [10.253.33.95] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 28 Sep
 2022 08:15:45 -0700
Message-ID: <f8690433-b264-d5f4-6806-d9babba6e6be@quicinc.com>
Date: Wed, 28 Sep 2022 23:15:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: mlo rx nss value 0 of wifi
Content-Language: en-US
From: Wen Gong <quic_wgong@quicinc.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        linux-wireless
	<linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>
References: <913ee04f-a16f-f765-96c2-0586282831b4@quicinc.com>
In-Reply-To: <913ee04f-a16f-f765-96c2-0586282831b4@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JVAdmSsb48byuZAWbMVrgOGnoOO2jceN
X-Proofpoint-ORIG-GUID: JVAdmSsb48byuZAWbMVrgOGnoOO2jceN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_06,2022-09-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 mlxlogscore=847 spamscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209280090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_081547_424007_A1563653 
X-CRM114-Status: GOOD (  13.58  )
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

SGkgSm9oYW5uZXMsCgpNYXkgSSBnZXQgeW91ciBjb21tZW50IGFib3V0IHRoaXM/CgpPbiA5LzEz
LzIwMjIgMTI6MzcgUE0sIFdlbiBHb25nIHdyb3RlOgo+IEhpIEpvaGFubmVzLAo+Cj4gQ3VycmVu
dGx5IGZvciBNTE8gdGVzdCwgdGhlIG90aGVycyBsaW5rcydzIHJ4X25zcyBvZiBzdHJ1Y3QKPiBp
ZWVlODAyMTFfbGlua19zdGEgaXMgc3RpbGwgdmFsdWUgMCBpbiBpZWVlODAyMTFfc2V0X2Fzc29j
aWF0ZWQoKSwKPiBiZWNhdWUgdGhleSBhcmUgbm90IHBhc3MgaW50byBpZWVlODAyMTFfc3RhX3Nl
dF9yeF9uc3MoKSBpbgo+IG1hYzgwMjExIGV4Y2VwdCB0aGUgZGVmbGluayB3aGljaCBtZWFucyB0
aGUgcHJpbWFyeSBsaW5rIGluCj4gcmF0ZV9jb250cm9sX3JhdGVfaW5pdCgpLiBUaGlzIGxlYWQg
ZHJpdmVyIGdldCBuc3MgPSAwIGZvcgo+IG90aGVyIGxpbmtzLiBXaWxsIHlvdSBmaXggaXQgb3Ig
aXMgaXQgZGVzaWduIGJ5IGRlZmF1bHQ/Cj4KPiBPbmx5IHByaW1hcnkgbGluayBoYXMgdmFsaWQg
cnhfbnNzIHZhbHVlIHdoaWNoIGlzIG5vdCAwIGJ5IGJlbG93IGNhbGwgCj4gc3RhY2suCj4gaWVl
ZTgwMjExX2Fzc29jX3N1Y2Nlc3MoKQo+IMKgwqDCoCAtPnJhdGVfY29udHJvbF9yYXRlX2luaXQo
c3RhKTsKPiDCoMKgIMKgwqDCoMKgIC0+aWVlZTgwMjExX3N0YV9zZXRfcnhfbnNzKCZzdGEtPmRl
ZmxpbmspOwoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
