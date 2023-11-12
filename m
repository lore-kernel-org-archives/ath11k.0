Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F500C4332F
	for <ath11k@archiver.kernel.org>; Sun, 12 Nov 2023 04:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RKQyrah87AAK8m8N55ETgGT8kmPpydZv2vA0LHbtyPg=; b=DiMmbscILcDh/0
	6JGqLHhkr7HtOfAlTJ5BiMD6a4kI0DSoL/d+9HeatmQtFSn+wxgLWlOqR+r+EESId8NBYF7DnU6tH
	/zw6YD/FLl63n8mDAQNjpL7vBMNAZUZa3Wvzza65qdSEox2aZPN1g5B/A+577UBKPd//j8cFxB2HW
	1iL9ueZa7B31w4kZLCsvxqBMS0ycuzH3WEEGw4/GSWnNQLbtDaQWVtSmDT5IEBUBcRgveX7CJEyGv
	Ifp24IAkzk3qrNNozZGcEsjBSrsYthTXwaGCI4bOCDgPljllv6GOTIIh41qYg0skxfohy0tFInNGZ
	4nylOvVQQwBg8sLifjag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r221n-00BfCE-22;
	Sun, 12 Nov 2023 04:24:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r221l-00BfBW-06
	for ath11k@lists.infradead.org;
	Sun, 12 Nov 2023 04:24:54 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AC4OivZ000997;
	Sun, 12 Nov 2023 04:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=MHyF5XFWxTDTGEuQZvCCBwCqoNyzxAZnfW1V2Z2coto=;
 b=AGBy4oEVe3DNXMq+nG6m1Ix/DcOtZE6GLSthQAbbbyAWm1KxIZ203+SVwfnVNw0y6NEp
 XIPoIddnns3ZdLNaHgymPFnfZ/k44Crmvw/iV0EUWLmhKlJsYlz2M1FlOIvogmvclHL/
 r9BMA6HJv7G3XPDVOIlwEhw+6rtsgT9KrdvIdEum6+9Y9GChqO2ME1wQz6zt7In/0nHS
 8HqRahePxwiaAU4rrI04UT0WIBmCl/LnbecFNXwlwlEBsSV4/WABBQwcrUOJrhfJmFyc
 K+yqvedvuunuyT4O7tkWz6YKPYJdhYP3E8ZjjHWPs0d2lzRYJQHIPbM5iEc1Db75tn4B Qg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ua2sw1b7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Nov 2023 04:24:44 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AC4OhuZ005337
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Nov 2023 04:24:43 GMT
Received: from [10.253.35.191] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Sat, 11 Nov
 2023 20:24:41 -0800
Message-ID: <e2ad1380-d55f-42bd-9f40-ef8aa6e0f105@quicinc.com>
Date: Sun, 12 Nov 2023 12:24:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 4/8] wifi: ath11k: remove MHI LOOPBACK channels
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
        <mhi@lists.linux.dev>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20231110102202.3168243-1-kvalo@kernel.org>
 <20231110102202.3168243-5-kvalo@kernel.org>
 <f56bce13-bba8-40d2-1dfc-210478ff63d6@quicinc.com>
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <f56bce13-bba8-40d2-1dfc-210478ff63d6@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: E3MZTNXumas3qj3-t4tOf1c-3D0HHu1Z
X-Proofpoint-GUID: E3MZTNXumas3qj3-t4tOf1c-3D0HHu1Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-12_01,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=515 priorityscore=1501
 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311120039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_202453_072473_A261BAA4 
X-CRM114-Status: GOOD (  11.99  )
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

Ck9uIDExLzExLzIwMjMgMTI6NTQgQU0sIEplZmZyZXkgSHVnbyB3cm90ZToKPiBPbiAxMS8xMC8y
MDIzIDM6MjEgQU0sIEthbGxlIFZhbG8gd3JvdGU6Cj4+IEZyb206IEJhb2NoZW4gUWlhbmcgPHF1
aWNfYnFpYW5nQHF1aWNpbmMuY29tPgo+Pgo+PiBUaGVyZSBpcyBubyBkcml2ZXIgdG8gbWF0Y2gg
dGhlc2UgdHdvIGNoYW5uZWxzLCBzbwo+PiByZW1vdmUgdGhlbS4gVGhpcyBmaXhlcyB3YXJuaW5n
cyBmcm9tIE1ISSBzdWJzeXN0ZW0gZHVyaW5nIHN1c3BlbmQ6Cj4+Cj4+IG1oaSBtaGkwX0xPT1BC
QUNLOiAxOiBGYWlsZWQgdG8gcmVzZXQgY2hhbm5lbCwgc3RpbGwgcmVzZXR0aW5nCj4+IG1oaSBt
aGkwX0xPT1BCQUNLOiAwOiBGYWlsZWQgdG8gcmVzZXQgY2hhbm5lbCwgc3RpbGwgcmVzZXR0aW5n
Cj4KPiBUaGlzIGZlZWxzIGxpa2UganVzdCBtYXNraW5nIGEgcmVhbCBpc3N1ZS4KPgo+IElmIExP
T1BCQUNLIGlzIG5vdCBiZWluZyBjb25zdW1lZCwgdGhlbiB0aGUgY2hhbm5lbCBzaG91bGQgbmV2
ZXIgZ28gCj4gaW50byB0aGUgc3RhcnQgc3RhdGUuwqAgV2h5IHdvdWxkIHdlIGJlIHRyeWluZyB0
byB0cmFuc2l0aW9uIHRvIHRoZSAKPiByZXNldCBzdGF0ZSB0aGVuPwo+Cj4gLUplZmYKVGhhdCBp
cyBiZWNhdXNlLCB3aXRoIHBhdGNoICdidXM6IG1oaTogaG9zdDogYWRkIG5ldyBpbnRlcmZhY2Vz
IHRvIApoYW5kbGUgTUhJIGNoYW5uZWxzIGRpcmVjdGx5JyBpbiB0aGlzIHBhdGNoIHNldCwgYXRo
MTFrIGlzIGFibGUgdG8gY2FsbCAKbWhpX3VucHJlcGFyZV9hbGxfZnJvbV90cmFuc2ZlcigpLCB3
aGljaCB3aWxsIHJlc2V0IGFsbCBjaGFubmVscy4KCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0
aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vYXRoMTFrCg==
