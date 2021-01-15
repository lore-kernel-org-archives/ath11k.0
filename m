Return-Path: <SRS0=6W4N=GS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_ALL,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,LOCALPART_IN_SUBJECT,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97735C433DB
	for <ath11k@archiver.kernel.org>; Fri, 15 Jan 2021 14:22:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FA1F23772
	for <ath11k@archiver.kernel.org>; Fri, 15 Jan 2021 14:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FA1F23772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cZM9/lxfa5jitZbdYUqoDIg4IPAfRDHpGDDGnwbVBMQ=; b=jNIJIhQW2SisIWZ77v7Fvk0stG
	KrgUd9kfbTrHlsHOz4IW3TK5zABgGq1JBJ+COuWMSDx0EUg7dsgtvox1ey6QZvZLgu3SoDJcvroR1
	8R/kyCgdi8ozzT0vFaJ2Wz9ZJZbamUi+fd+uOvHf6tPP+8Ap4/kwOwRmkIEwxhDWBBxw3ygzHuxX3
	hQLAwIJ/9ne2pV2j/l+aYzMP/Jzu2PdbNlLZVGLLmcH3Z8MzzdA9PEnCkuz1hcQE/s2OWszTytKSG
	MKQNrz4WA70uYaO7zlO/9FEENMj3Ge7Eh9w4fkbBKk9d4DOshIkhutZBgw5jqE4MJIF8CsWKNThyW
	ZVnBVOiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0PzN-0006b5-KB; Fri, 15 Jan 2021 14:22:09 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0PzK-0006aQ-TQ
 for ath11k@lists.infradead.org; Fri, 15 Jan 2021 14:22:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1610720525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2f5dUSdyMBYuYMZjKln3F8iB23npPI8BG5TWkwGszek=;
 b=zswvj4Sf2zHbUnZd6RV/GRl07L/tm0pC8cm5PaS+Kd0Ak9fhBfMdfTs9192390P+Adevti
 /b0C3K6MtBUeUE9YrbRRoM3p9+VfKhLZOCMQpGXSeSUeAIcwnAc82XWcihoLX+2JDlppiN
 /xbnJcgo8iGM6Lfj4hq66UayXNOxycM=
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org
Subject: ath11k: IPQ8074: hw2.0: WMI_PEER_STA_KICKOUT after 3900 seconds
Date: Fri, 15 Jan 2021 15:22:02 +0100
Message-ID: <3150903.KgjxqYA5nG@ripper>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_092207_208272_46B8D6DD 
X-CRM114-Status: GOOD (  11.03  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi,

a rather odd behavior was noticed with ath11k and EAP. All kind of devices can 
successfully connect to the AP and use it perfectly fine for over an hour. But 
after 65 minutes, the ath11k firmware suddenly sends an 
WMI_PEER_STA_KICKOUT_EVENT - which will be handled by hostapd as 
DISASSOC_LOW_ACK. Which means that the connected station will be disconnected.

This was observed with firmware WLAN.HK.2.4.0.1.r1-00026-QCAHKSWPL_SILICONZ-2 
and WLAN.HK.2.5.0.1.r1-00004-QCAHKSWPL_SILICONZ-1 (no other firmware was 
tested). And all kind of clients (Linux/Windows/Mac, ath9k/iwlwifi/...) were
tested - with the same results.

Interestingly, I can just remove the WMI_PEER_STA_KICKOUT_EVENTID handler and 
then I can use the AP for hours. It should also be possible to achieve the
same by setting disassoc_low_ack=0 but I haven't verified this with my
setup yet.


But here the logs for when it actually happens (hostapd, verbose logs):

    Fri Jan 15 07:40:15 2021 daemon.debug hostapd: ap2_1: STA a4:34:d9:c4:8a:a1 IEEE 802.1X: Sending EAP Packet (identifier 10)
    Fri Jan 15 07:40:15 2021 daemon.debug hostapd: ap2_1: STA a4:34:d9:c4:8a:a1 IEEE 802.1X: received EAP packet (code=2 id=10 len=46) from STA: EAP Response-unknown (25)
    Fri Jan 15 07:40:15 2021 daemon.debug hostapd: ap2_1: RADIUS Sending RADIUS message to authentication server
    Fri Jan 15 07:40:15 2021 daemon.debug hostapd: ap2_1: RADIUS Next RADIUS client retransmit in 3 seconds
    Fri Jan 15 07:40:15 2021 daemon.debug hostapd: ap2_1: RADIUS Received 167 bytes from RADIUS server
    Fri Jan 15 07:40:15 2021 daemon.debug hostapd: ap2_1: RADIUS Received RADIUS message
    Fri Jan 15 07:40:15 2021 daemon.debug hostapd: ap2_1: STA a4:34:d9:c4:8a:a1 RADIUS: Received RADIUS packet matched with a pending request, round trip time 0.00 sec
    Fri Jan 15 07:40:15 2021 daemon.debug hostapd: ap2_1: STA a4:34:d9:c4:8a:a1 IEEE 802.11: binding station to interface 'ap2_1'
    Fri Jan 15 07:40:15 2021 daemon.debug hostapd: ap2_1: STA a4:34:d9:c4:8a:a1 IEEE 802.1X: old identity 'steve' updated with User-Name from Access-Accept 'steve'
    Fri Jan 15 07:40:15 2021 daemon.debug hostapd: ap2_1: STA a4:34:d9:c4:8a:a1 IEEE 802.1X: decapsulated EAP packet (code=3 id=10 len=4) from RADIUS server: EAP Success
    Fri Jan 15 07:40:15 2021 daemon.notice hostapd: ap2_1: CTRL-EVENT-EAP-SUCCESS2 a4:34:d9:c4:8a:a1
    Fri Jan 15 07:40:15 2021 daemon.debug hostapd: ap2_1: STA a4:34:d9:c4:8a:a1 IEEE 802.1X: Sending EAP Packet (identifier 10)
    Fri Jan 15 07:40:15 2021 daemon.debug hostapd: ap2_1: STA a4:34:d9:c4:8a:a1 WPA: sending 1/4 msg of 4-Way Handshake
    Fri Jan 15 07:40:15 2021 daemon.debug hostapd: ap2_1: STA a4:34:d9:c4:8a:a1 WPA: received EAPOL-Key frame (2/4 Pairwise)
    Fri Jan 15 07:40:15 2021 daemon.debug hostapd: ap2_1: STA a4:34:d9:c4:8a:a1 WPA: sending 3/4 msg of 4-Way Handshake
    Fri Jan 15 07:40:15 2021 daemon.debug hostapd: ap2_1: STA a4:34:d9:c4:8a:a1 WPA: received EAPOL-Key frame (4/4 Pairwise)
    Fri Jan 15 07:40:15 2021 daemon.info hostapd: ap2_1: STA a4:34:d9:c4:8a:a1 WPA: pairwise key handshake completed (RSN)
    Fri Jan 15 07:40:15 2021 daemon.notice hostapd: ap2_1: AP-STA-CONNECTED a4:34:d9:c4:8a:a1
    Fri Jan 15 07:40:15 2021 daemon.debug hostapd: ap2_1: STA a4:34:d9:c4:8a:a1 IEEE 802.1X: authorizing port
    Fri Jan 15 07:40:15 2021 daemon.info hostapd: ap2_1: STA a4:34:d9:c4:8a:a1 RADIUS: starting accounting session 4E2531BE1954F4B0
    Fri Jan 15 07:40:15 2021 daemon.info hostapd: ap2_1: STA a4:34:d9:c4:8a:a1 IEEE 802.1X: authenticated - EAP type: 25 (unknown)
    Fri Jan 15 08:45:16 2021 daemon.info hostapd: ap2_1: STA a4:34:d9:c4:8a:a1 IEEE 802.11: disconnected due to excessive missing ACKs
    Fri Jan 15 08:45:16 2021 daemon.notice hostapd: ap2_1: AP-STA-DISCONNECTED a4:34:d9:c4:8a:a1
    Fri Jan 15 08:45:16 2021 daemon.debug hostapd: ap2_1: STA a4:34:d9:c4:8a:a1 MLME: MLME-DISASSOCIATE.indication(a4:34:d9:c4:8a:a1, 34)
    Fri Jan 15 08:45:16 2021 daemon.debug hostapd: ap2_1: STA a4:34:d9:c4:8a:a1 MLME: MLME-DELETEKEYS.request(a4:34:d9:c4:8a:a1)
    Fri Jan 15 08:45:16 2021 kern.info kernel: [ 4096.030938] ath11k c000000.wifi1: Station a4:34:d9:c4:8a:a1 moved to disassociated state

This was tested with hostapd ca8c2bd28ad53f431d6ee60ef754e98cfdb4c17b 
(2019-08-08) and 58b384f467224a1d43f3f947fd53e08b019cbcd3 (2020-06-26)


Btw. rekeying was disabled (but also setting it to 900s or 3600s doesn't 
change the behavior at all. So here my hostapd config for completeness:

    driver=nl80211
    logger_syslog=127
    logger_syslog_level=0
    logger_stdout=127
    logger_stdout_level=0
    country_code=US
    ieee80211d=1
    hw_mode=g
    beacon_int=100
    channel=6

    ieee80211n=1
    ht_coex=0
    ht_capab=[LDPC][SHORT-GI-20][SHORT-GI-40][TX-STBC][RX-STBC1][MAX-AMSDU-7935][DSSS_CCK-40]
    
    interface=ap2_1
    ctrl_interface=/var/run/hostapd
    ap_isolate=1
    bss_load_update_period=60
    chan_util_avg_period=600
    disassoc_low_ack=1
    preamble=1
    wmm_enabled=1
    ignore_broadcast_ssid=0
    uapsd_advertisement_enabled=1
    utf8_ssid=1
    multi_ap=0
    auth_server_addr=192.168.72.101
    auth_server_port=1812
    auth_server_shared_secret=testing123
    eapol_key_index_workaround=1
    ieee8021x=1
    auth_algs=1
    wpa=2
    wpa_pairwise=CCMP
    ssid=eaptest
    bridge=br-lan
    wpa_disable_eapol_key_retries=0
    wpa_key_mgmt=WPA-EAP
    okc=0
    disable_pmksa_caching=1
    bssid=f8:d9:b8:2e:37:d0
    eap_reauth_period=0


The server you see here is just standard freeradius from Debian Buster with 
two changes to allow PEAP (without CA) password logins:

    diff --git a/freeradius/3.0/clients.conf b/freeradius/3.0/clients.conf
    index 9dbc3e9..ec3895e 100644
    --- a/freeradius/3.0/clients.conf
    +++ b/freeradius/3.0/clients.conf
    @@ -238,10 +238,10 @@ client localhost_ipv6 {
     #  When a client request comes in, the BEST match is chosen.
     #  i.e. The entry from the smallest possible network.
     #
    -#client private-network-1 {
    -#	ipaddr		= 192.0.2.0/24
    -#	secret		= testing123-1
    -#}
    +client private-network-1 {
    +	ipaddr		= 192.168.0.0/16
    +	secret		= testing123
    +}
     
     #client private-network-2 {
     #	ipaddr		= 198.51.100.0/24
    diff --git a/freeradius/3.0/mods-config/files/authorize b/freeradius/3.0/mods-config/files/authorize
    index 67e0cd4..bf27365 100644
    --- a/freeradius/3.0/mods-config/files/authorize
    +++ b/freeradius/3.0/mods-config/files/authorize
    @@ -70,7 +70,7 @@
     # entry so that no DEFAULT entry will be used, and the user will NOT
     # get any attributes in addition to the ones listed here.
     #
    -#steve	Cleartext-Password := "testing"
    +steve	Cleartext-Password := "testing"
     #	Service-Type = Framed-User,
     #	Framed-Protocol = PPP,
     #	Framed-IP-Address = 172.16.3.33,


Exactly the same software was tested on the same hardware with ath10k - by 
replacing the "interface=" with the ath10k (fw QCA9887 10.2.4-1.0-00047). 
This worked stable for more than these odd 65 minutes.

Kind regards,
	Sven



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
