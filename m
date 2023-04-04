Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78E9C7618D
	for <ath11k@archiver.kernel.org>; Tue,  4 Apr 2023 03:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VZ4Yw7xiqLq/SgD2IhYFqv6elPg/DqiFs8xdqJnBxjU=; b=VzMEkT6yu1dHRz
	PB3FrVrmCredBOuh/snzDg0D7YSvuxvyluE117pOZWnglJcRBteci6AiAfiRiNv87pgDOuatl8fsS
	Z4HSBQWSS1ZHPkzmBD1TlKAYv4BTa4QIIoPJwuDp0V8UDYpo237+jQXUk19tR7/XY3ovuGoj+/gbv
	jDTf7cyOHBw9VvEn5HzWstr4EFS6YaTVuhD4q75vJZCKLBD3FXoLjlPau9mLgy6xMFWI0IIlca/z7
	VbKrGfJWwIoE0bThBa/IomRhwnugbRAIrS3q5+Z2IGmgweN4Dt6+a4iRZzY1f+hFTaT/k9QJ/2Fof
	GXQWLDeP5JVLHWpG7eIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjXLl-00HW4K-2i;
	Tue, 04 Apr 2023 03:28:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjXLi-00HW3m-31
	for ath11k@lists.infradead.org;
	Tue, 04 Apr 2023 03:28:48 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3340Z4SI003797;
	Tue, 4 Apr 2023 03:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=V1j893hACUTw9r0p8d8gMQXdB00Y80DLJrGvSl1tZ0U=;
 b=mAv13cvigqOEMZp0u6bU5jr3QXMJsCXInT8ii4xspIbd4pXLWjL5f1okUPWSUc+oBBQW
 4Q+xs+NTV7FsgynpYM6uZYzFWsVo6Dq6E5FmOH+YGHHFnydT+qbztjENe3ZmtTvC8UXI
 oGM3w+jl46B45yJ4UfbHob2b8ph54sOJV2cOrdPtIgHpW8X28gNdG9OJnEjBu+xZxCol
 gjxtct7uK57eU8jGBJqFs3tKFgX2lvf34/J/DbpXQ+n72hHn5eEu8M3Mn9lED7MZ78A8
 0jEh7v4DjHHw9d0rJ9ZwvTwcOD7sVDAAEzsKyb7uTZbWN5mKoeXHGKL+5ErDQbJwuInj 1w== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pqtdnajgx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Apr 2023 03:28:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3343Si9Y020209
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Apr 2023 03:28:44 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 3 Apr 2023
 20:28:43 -0700
Message-ID: <d10b88b4-0bd7-a38c-e8d7-8982a281c4b3@quicinc.com>
Date: Tue, 4 Apr 2023 11:28:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 10/27] wifi: mac80211: isolate driver from inactive links
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        <linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
 <20220902161143.5ce3dad3be7c.I92e9f7a6c120cd4a3631baf486ad8b6aafcd796f@changeid>
 <5d82e564-86bf-c26b-077a-d0bc14e2d3c3@quicinc.com>
 <74f3eb848326607b15336c31a02bdd861ccafb47.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <74f3eb848326607b15336c31a02bdd861ccafb47.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dGbWrLjfc6vzCpyOKhiAy9uoOPjMnv9K
X-Proofpoint-GUID: dGbWrLjfc6vzCpyOKhiAy9uoOPjMnv9K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_19,2023-04-03_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304040030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_202847_116787_5247EB19 
X-CRM114-Status: GOOD (  17.68  )
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

T24gOS84LzIwMjIgMTE6MzYgUE0sIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4gT24gVGh1LCAyMDIy
LTA5LTA4IGF0IDIzOjIzICswODAwLCBXZW4gR29uZyB3cm90ZToKPj4gTm93IEkgZm91bmQgaXQg
b25seSBhY3RpdmUgdGhlIHByaW1heSBsaW5rKHRoZSBsaW5rIGZvcgo+PiBhdXRoZW50aWNhdGlv
bi9hc3NvYyByZXF1ZXN0KSBpbiBteSBzdGF0aW9uIE1MTyB0ZXN0LAo+IFllcywgdGhhdCdzIGlu
dGVudGlvbmFsLiBJdCBnaXZlcyB0aGUgZHJpdmVyIGNob2ljZSBhYm91dCB3aGljaCBsaW5rcyB0
bwo+IGFjdGl2YXRlOyBmaXJzdCBvZiBhbGwgYmVjYXVzZSB3ZSBkb24ndCBoYXZlIGludGVyZmFj
ZS9saW5rIGNvbWJpbmF0aW9ucwo+IHN0dWZmIHlldCAod2FpdGluZyBmb3IgeW91ciBzaWRlIG9u
IHRoYXQpLCBhbmQgc2Vjb25kbHkgYmVjYXVzZSB3ZSBtaWdodAo+IHZlcnkgd2VsbCAod2FudCB0
bykgbmVnb3RpYXRlIG1vcmUgbGlua3MgdGhhbiB3ZSBjYW4gY29uY3VycmVudGx5IGhhdmUKPiBh
Y3RpdmUsIGUuZy4gYSBOSUMgdGhhdCBjYW4gaGF2ZSB0d28gYWN0aXZlIG1pZ2h0IHN0aWxsIHdh
bnQgdG8KPiBuZWdvdGlhdGUgZm91ciBhbmQgc3dpdGNoIGR5bmFtaWNhbGx5Lgo+Cj4+IGNoYW5n
ZV92aWZfbGlua3Mgb2Ygc3RydWN0IGllZWU4MDIxMV9vcHMgKm9wcyBvZiBkcml2ZXIgd2lsbCBv
bmx5IGJlCj4+IGNhbGxlZCBvbmUgdGltZSBmb3IgdGhlIHByaW1hcnkgbGluay4KPiBDb3JyZWN0
Lgo+Cj4+IGl0IG1lYW5zIG9ubHkgb25lIGxpbmsgZm9yIE1MTy4KPiBSaWdodC4KPgo+PiBJIHBs
YW4gdG8gcmV2ZXJ0IHRoaXMgcGF0Y2ggaW4gbXkgbG9jYWwgdGVzdCBub3cuCj4+Cj4+IFdpbGwg
eW91IGltcGxlbWVudCBtdXRpLWxpbmtzIGxhdGVyPwo+IFllcy4gSSBoYXZlIHBhdGNoZXMgcGVu
ZGluZyB0byBhZGQgQVBJIHRoYXQgdGhlIGRyaXZlciBjYW4gY2FsbCB0byBwaWNrCj4gdGhlIGFj
dGl2ZSBsaW5rcyAoYXMgYSBiaXRtYXApLgo+Cj4gSSdsbCBzZW5kIGl0IG91dCB3aGVuIEkgY2Fu
LCBsaWtlbHkgdG9tb3Jyb3cuCj4KPiBqb2hhbm5lcwpUaGUgcGF0Y2hlcyBzaG91bGQgYmUgIndp
Zmk6IG1hYzgwMjExOiBpbXBsZW1lbnQgbGluayBzd2l0Y2hpbmciIGZvciAKaWVlZTgwMjExX3Nl
dF9hY3RpdmVfbGlua3MoKS4KCk1heSBJIGFsc28gYWRkIGEgZmllbGQgc3VjaCBhcyAidTE2IGFj
dGl2ZV9saW5rc19jb3VudCIgaW4gc3RydWN0IAp3aXBoeV9pZnR5cGVfZXh0X2NhcGFiLAphbmQg
YWRkIGxvZ2ljIGluIGZ1bmN0aW9uIGllZWU4MDIxMV9zZXRfdmlmX2xpbmtzX2JpdG1hcHMoKSBm
b3Igc3RhdGlvbiAKbGlrZSB0aGlzID86CmlmIChhY3RpdmVfbGlua3NfY291bnQgJiYgaHdlaWdo
dDE2KGxpbmtzKSA8PSBhY3RpdmVfbGlua3NfY291bnQpCiDCoMKgwqAgdGhlbiBzZGF0YS0+dmlm
LmFjdGl2ZV9saW5rcyA9IGxpbmtzOwoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hdGgxMWsK
